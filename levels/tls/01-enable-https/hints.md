## 1
HTTPS is just HTTP wrapped in TLS, served by its own listener on 443 that must present a certificate and hold the matching private key. A config with only a port-80 server has nothing listening there — `curl -k https://127.0.0.1:9443/` fails to connect.
## 2
A TLS vhost needs `listen 443 ssl;` plus `ssl_certificate` and `ssl_certificate_key`.
## 3
Add a `server { listen 443 ssl; ssl_certificate /etc/nginx/certs/fullchain.crt; ssl_certificate_key /etc/nginx/certs/server.key; location / { return 200 "tls ok\n"; } }` and restart nginx.
