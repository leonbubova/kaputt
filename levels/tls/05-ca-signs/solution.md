Request with your key, then let the CA sign it.
    openssl req -new -key my.key -subj /CN=shop.local -out shop.csr
    openssl x509 -req -in shop.csr -CA ca.crt -CAkey ca.key -CAcreateserial -days 30 -out shop.crt
