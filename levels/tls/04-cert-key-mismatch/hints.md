## 1
`docker logs wg-tls` shows "key values mismatch" — nginx exited on start.
## 2
`ssl_certificate_key` points at a key that isn't the pair of the certificate.
## 3
Set it back to `/etc/nginx/certs/server.key` and restart nginx.
