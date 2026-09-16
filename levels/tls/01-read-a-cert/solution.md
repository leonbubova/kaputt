Read the two fields off the certificate and write them into the file.
    cd ~/.k8s-wargame/tls/lab && openssl x509 -noout -subject -issuer -in shop.crt > who.txt
