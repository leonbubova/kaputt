## 1
Two commands: `openssl req -new` writes the request from your key and name; `openssl x509 -req` turns the request into a certificate signed by the CA.
## 2
Request: `openssl req -new -key my.key -subj /CN=shop.local -out shop.csr`. Sign: `openssl x509 -req -in shop.csr -CA ca.crt -CAkey ca.key -CAcreateserial -days 30 -out shop.crt`.
## 3
    cd ~/.k8s-wargame/tls/lab
    openssl req -new -key my.key -subj /CN=shop.local -out shop.csr
    openssl x509 -req -in shop.csr -CA ca.crt -CAkey ca.key -CAcreateserial -days 30 -out shop.crt
