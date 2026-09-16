# a CA signs your certificate
Lesson: a real certificate is signed by a CA (certificate authority) — an issuer the browsers already trust.
That takes two steps. First you write a request (a CSR): your name plus your public key, nothing signed yet.
Then the CA signs the request with ITS private key and hands back the certificate. Your private key never
travels; only the request does.
    openssl req -new -key my.key -subj /CN=NAME -out NAME.csr          the request (no -x509 this time)
    openssl x509 -req -in NAME.csr -CA ca.crt -CAkey ca.key -CAcreateserial -days 30 -out NAME.crt    the CA signs
`-CA` / `-CAkey` are the CA's certificate and private key (in the lab, you play the CA too).
`-CAcreateserial` gives every signed certificate a serial number; just always pass it.
Try it (my.key, ca.crt and ca.key are in the lab):
    cd ~/.k8s-wargame/tls/lab
    openssl req -new -key my.key -subj /CN=demo.local -out demo.csr
    openssl req -noout -subject -in demo.csr
    openssl x509 -req -in demo.csr -CA ca.crt -CAkey ca.key -CAcreateserial -days 30 -out demo.crt
    openssl x509 -noout -subject -issuer -in demo.crt
Subject demo.local, issuer WG-Root-CA — no longer self-signed.
Your task: get a certificate `~/.k8s-wargame/tls/lab/shop.crt` for the name `shop.local`, belonging to `my.key`,
signed by the CA `ca.crt` / `ca.key`, valid 30 days. (The request file name is yours to choose.)
Work in ~/.k8s-wargame/tls/lab.
Check yourself:  wg check      stuck?  wg hint
