## 1
Same command as the demo in the lesson, different name and output file. `-key my.key` is what ties the certificate to your key.
## 2
`openssl req -x509 -key my.key -subj /CN=NAME -days 30 -out FILE` with NAME test.local and FILE test.crt.
## 3
    cd ~/.k8s-wargame/tls/lab
    openssl req -x509 -key my.key -subj /CN=test.local -days 30 -out test.crt
