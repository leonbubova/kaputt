Read the field off the leaf certificate.
    openssl x509 -noout -enddate -in $APP/certs/fullchain.crt > $APP/certs/EXPIRES.txt
