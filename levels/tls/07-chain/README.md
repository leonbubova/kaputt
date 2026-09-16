# the chain: root, intermediate, leaf — and openssl verify
Lesson: real CAs don't sign websites with their root. The root signs an intermediate CA, the intermediate
signs the website's certificate (the leaf). A client only trusts the root, so to accept the leaf it must
see the whole chain: leaf → intermediate → root. The root it has; the intermediate must be sent by the
server, together with the leaf. Missing intermediate = "unable to get local issuer certificate".
`openssl verify` is the client's check as a command: `-CAfile ROOT` says what is trusted, `-untrusted FILE`
supplies the in-between certificates, the last argument is the leaf to check.
Try it (leaf.crt, int.crt and root.crt are in the lab):
    cd ~/.k8s-wargame/tls/lab
    openssl x509 -noout -subject -issuer -in leaf.crt      issued by WG-Intermediate-CA
    openssl x509 -noout -subject -issuer -in int.crt       issued by WG-Root-CA
    openssl verify -CAfile root.crt leaf.crt               fails: unable to get local issuer certificate
    openssl verify -CAfile root.crt -untrusted int.crt leaf.crt     OK
Servers send leaf and intermediate as ONE file, the leaf first: that is a "fullchain" file, made with `cat`.
Your task: create `~/.k8s-wargame/tls/lab/fullchain.crt` holding leaf.crt followed by int.crt, so that
`openssl verify -CAfile root.crt -untrusted fullchain.crt leaf.crt` says OK.
Work in ~/.k8s-wargame/tls/lab.
Check yourself:  wg check      stuck?  wg hint
