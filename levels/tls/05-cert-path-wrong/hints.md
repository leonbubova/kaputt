## 1
`docker logs wg-tls` shows it cannot load the certificate — "No such file or directory".
## 2
`ssl_certificate` points at a file that isn't there. List /etc/nginx/certs.
## 3
Set `ssl_certificate /etc/nginx/certs/fullchain.crt;` and restart.
