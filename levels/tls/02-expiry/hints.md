## 1
The validity dates are fields like subject and issuer: one flag prints them. `-enddate` prints one line starting with `notAfter=`.
## 2
`openssl x509 -noout -enddate -in shop.crt` prints the line; `> expires.txt` puts it into the file instead of the screen.
## 3
    cd ~/.k8s-wargame/tls/lab
    openssl x509 -noout -enddate -in shop.crt > expires.txt
