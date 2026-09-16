## 1
nginx opens every `ssl_certificate` file while parsing its config at startup — a path that doesn't exist is a fatal config error, so the whole server exits instead of just one vhost failing. `docker logs wg-tls` shows it cannot load the certificate — "No such file or directory".
## 2
`ssl_certificate` points at a file that isn't there. List /etc/nginx/certs.
## 3
Set `ssl_certificate /etc/nginx/certs/fullchain.crt;` and restart.
