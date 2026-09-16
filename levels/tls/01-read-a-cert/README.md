# a certificate is a name, a key and a signature
Lesson: a certificate is a small file a server shows to prove who it is. Inside are three things:
a name (the subject — which website this is for), a public key (more on keys in lesson 3), and a
signature from an issuer — someone else who vouches "this name and this key belong together".
The file is text (`-----BEGIN CERTIFICATE-----`…), but the inside is encoded; `openssl` reads it for you.
`openssl x509` is the command for certificates. `-in FILE` names the file, `-noout` means "don't print the
encoded blob", and a flag per field says what you want: `-subject` (the name), `-issuer` (who signed it).
Try it — a certificate is waiting in the lab folder:
    cd ~/.k8s-wargame/tls/lab
    cat shop.crt
    openssl x509 -noout -subject -in shop.crt
    openssl x509 -noout -issuer -in shop.crt
`CN=shop.local` is the name (CN = common name). The issuer is `WG-Intermediate-CA` — a CA is a certificate
authority: an issuer whose job is signing other people's certificates.
Your task: put both lines — the subject line and the issuer line, exactly as openssl prints them — into the
file `~/.k8s-wargame/tls/lab/who.txt`. (`>` writes into a file, `>>` adds to the end of it.)
Work in ~/.k8s-wargame/tls/lab (cd there first — every file name in these lessons is inside that folder).
Check yourself:  wg check      stuck?  wg hint
