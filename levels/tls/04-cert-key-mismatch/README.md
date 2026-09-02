# a certificate and its private key are a pair — nginx refuses to start with a mismatch
Lesson: a certificate is public. It contains a public key plus a name and a CA signature. The private key is the secret other half of that exact public key, and it is how the server proves during the handshake that the certificate is really its own. Any other key is useless with this cert.
nginx checks the pair when it loads the config. A mismatch is a fatal error, so nginx exits and every site in the config is down. The symptom is a dead container and "key values mismatch" in its log.
You can check a pair yourself: for RSA both files contain the same modulus, so hash it on each side and compare.
    docker logs wg-tls                                                    why nginx exited
    openssl x509 -noout -modulus -in certs/fullchain.crt | openssl md5    fingerprint of the cert's key
    openssl rsa  -noout -modulus -in certs/server.key    | openssl md5    fingerprint of a private key
    docker restart wg-tls                                                 cert/key changes need a restart
Try it first: from ~/.k8s-wargame/tls/app run the two openssl lines against fullchain.crt and each .key in certs/ — exactly one key matches.
Your task: after a cert rotation nginx won't start. The TLS config points at a private key that doesn't belong to the served certificate, so nginx fails to start and the whole site is down. Point it back at the matching key.
Check yourself:  wg check      stuck?  wg hint
