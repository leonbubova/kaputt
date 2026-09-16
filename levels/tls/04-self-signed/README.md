# a self-signed certificate
Lesson: who signs a certificate? For testing, you can: a self-signed certificate is one where subject and
issuer are the same name — you vouch for yourself. Browsers don't trust that (anyone can vouch for
themselves), but it is the smallest possible certificate and perfect for seeing how one is made.
`openssl req` builds certificates and requests. With `-x509` it makes a finished, self-signed certificate:
`-key FILE` says which private key it belongs to (its public half goes into the certificate),
`-subj /CN=NAME` sets the name, `-days N` the validity, `-out FILE` where to write it.
Try it (my.key from lesson 3 is in the lab):
    cd ~/.k8s-wargame/tls/lab
    openssl req -x509 -key my.key -subj /CN=demo.local -days 30 -out demo.crt
    openssl x509 -noout -subject -issuer -dates -in demo.crt
Subject and issuer are both `CN=demo.local`: self-signed. The certificate and my.key belong together —
this prints the same public key twice:
    openssl x509 -noout -pubkey -in demo.crt
    openssl pkey -pubout -in my.key
Your task: make a self-signed certificate `~/.k8s-wargame/tls/lab/test.crt` for the name `test.local`,
belonging to `my.key`, valid 30 days.
Work in ~/.k8s-wargame/tls/lab.
Check yourself:  wg check      stuck?  wg hint
