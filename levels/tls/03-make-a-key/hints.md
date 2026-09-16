## 1
A private key is just a file that openssl generates; nothing else is needed. `genrsa` makes an RSA one.
## 2
`openssl genrsa -out NAME SIZE` — the name is `my.key`, the size is 2048, in the lab folder.
## 3
    cd ~/.k8s-wargame/tls/lab
    openssl genrsa -out my.key 2048
