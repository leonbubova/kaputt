# nginx is down — it can't open the certificate file
The TLS server references a certificate path that doesn't exist, so nginx fails to start.
The real certificate is /etc/nginx/certs/fullchain.crt. Fix the path.
