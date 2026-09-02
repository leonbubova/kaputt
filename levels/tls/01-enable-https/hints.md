## 1
`curl -k https://127.0.0.1:9443/` fails to connect — no server listens on 443.
## 2
A TLS vhost needs `listen 443 ssl;` plus `ssl_certificate` and `ssl_certificate_key`.
## 3
Add a `server { listen 443 ssl; ssl_certificate /etc/nginx/certs/fullchain.crt; ssl_certificate_key /etc/nginx/certs/server.key; location / { return 200 "tls ok\n"; } }` and restart nginx.
