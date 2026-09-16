The SAN comes from an ext file at signing time.
    echo subjectAltName=DNS:shop.local > san.ext
    openssl x509 -req -in shop.csr -CA ca.crt -CAkey ca.key -CAcreateserial -days 30 -extfile san.ext -out shop.crt
