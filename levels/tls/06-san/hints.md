## 1
The SAN is added at signing time, never afterwards. It comes from an ext file: one line `subjectAltName=DNS:NAME`.
## 2
`echo subjectAltName=DNS:shop.local > san.ext`, then the signing command from lesson 5 with `-extfile san.ext` added and `-out shop.crt`.
## 3
    cd ~/.k8s-wargame/tls/lab
    echo subjectAltName=DNS:shop.local > san.ext
    openssl x509 -req -in shop.csr -CA ca.crt -CAkey ca.key -CAcreateserial -days 30 -extfile san.ext -out shop.crt
