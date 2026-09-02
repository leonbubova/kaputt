## 1
Two problems: `ssl_certificate` serves only the leaf, and the port-80 server no longer redirects.
## 2
Serve fullchain.crt for the chain, and restore `return 301 https://...` on port 80.
## 3
`ssl_certificate /etc/nginx/certs/fullchain.crt;` and `return 301 https://$host$request_uri;`, then reload.
