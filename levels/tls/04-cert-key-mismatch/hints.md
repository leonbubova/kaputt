## 1
A certificate contains a public key, and the private key on disk must be its other half — nginx checks the pair at startup and refuses to start if they don't match, taking every vhost down with it. `docker logs wg-tls` shows "key values mismatch" — nginx exited on start.
## 2
`ssl_certificate_key` points at a key that isn't the pair of the certificate.
## 3
Set it back to `/etc/nginx/certs/server.key` and restart nginx.
