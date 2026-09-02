## 1
Verification fails with "unable to get local issuer certificate" — the intermediate isn't sent.
## 2
`ssl_certificate` must point at the leaf+intermediate bundle, not the bare leaf (server.crt).
## 3
Set `ssl_certificate /etc/nginx/certs/fullchain.crt;` and reload.
