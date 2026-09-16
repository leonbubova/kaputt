## 1
A certificate is a readable file: `openssl x509 -noout -text -in ~/.k8s-wargame/tls/app/certs/fullchain.crt` dumps everything in it — issuer, subject, validity, SANs. (fullchain.crt holds two certs; openssl reads the first, the leaf.)
## 2
Single fields have their own flags: `-subject`, `-dates`, `-enddate`. `-enddate` prints one line, `notAfter=…`.
## 3
`openssl x509 -noout -enddate -in ~/.k8s-wargame/tls/app/certs/fullchain.crt > ~/.k8s-wargame/tls/app/certs/EXPIRES.txt`
