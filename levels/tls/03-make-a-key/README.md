# a key pair: private and public
Lesson: the "public key" inside a certificate is one half of a pair. The other half, the private key, lives
only on the server and is never shown to anyone. Whatever one half locks, only the other half unlocks —
that is how a server proves it really owns the certificate it shows: it can answer with the private half.
Rule to remember: a certificate without its private key is useless, and a private key must never leave the server.
You make a key pair with `openssl genrsa` (RSA is the kind of key): `-out FILE` is where it goes, the number
at the end is the size in bits — 2048 is the normal size.
Try it:
    cd ~/.k8s-wargame/tls/lab
    openssl genrsa -out demo.key 2048
    cat demo.key
    openssl rsa -noout -text -in demo.key | head -3
The file starts with `-----BEGIN PRIVATE KEY-----`. The public half is derived from it any time you need it:
    openssl pkey -pubout -in demo.key
Your task: create a 2048-bit RSA private key named `~/.k8s-wargame/tls/lab/my.key`. Keep it — the next lessons build on it.
Work in ~/.k8s-wargame/tls/lab.
Check yourself:  wg check      stuck?  wg hint
