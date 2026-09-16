# the names a certificate is valid for: SAN
Lesson: the CN in the subject is only a label. What browsers and curl actually compare against the address
you typed is a list inside the certificate called the SAN (subject alternative name): `DNS:shop.local`,
possibly several. No SAN, or a different name in it → "hostname mismatch", even if the CN is right.
The signing step decides what goes in. Extras like the SAN come from a small text file passed with `-extfile`:
    subjectAltName=DNS:shop.local
Try it (a request shop.csr for my.key, and ca.crt/ca.key, are in the lab):
    cd ~/.k8s-wargame/tls/lab
    openssl x509 -req -in shop.csr -CA ca.crt -CAkey ca.key -CAcreateserial -days 30 -out nosan.crt
    openssl x509 -noout -ext subjectAltName -in nosan.crt          "No extensions" — no names at all
    echo subjectAltName=DNS:demo.local > demo.ext
    openssl x509 -req -in shop.csr -CA ca.crt -CAkey ca.key -CAcreateserial -days 30 -extfile demo.ext -out demo.crt
    openssl x509 -noout -ext subjectAltName -in demo.crt           DNS:demo.local
Your task: sign `shop.csr` with the CA into `~/.k8s-wargame/tls/lab/shop.crt` so that its SAN contains `DNS:shop.local`
(write the ext file `~/.k8s-wargame/tls/lab/san.ext` first).
Work in ~/.k8s-wargame/tls/lab.
Check yourself:  wg check      stuck?  wg hint
