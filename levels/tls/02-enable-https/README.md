# the site serves plain HTTP only — HTTPS on 443 is dead
shop.local answers on port 80 but nothing listens on 443. The server certificate and key are
already on disk under /etc/nginx/certs (fullchain.crt + server.key).
Add a TLS server block on 443 that uses them and returns "tls ok".
