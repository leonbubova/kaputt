## 1
Clients only trust root CAs, but your leaf certificate is signed by an intermediate — the client needs that intermediate to walk from the leaf up to a trusted root, and it's the server's job to send it along. Verification fails with "unable to get local issuer certificate" — the intermediate isn't sent.
## 2
`ssl_certificate` must point at the leaf+intermediate bundle, not the bare leaf (server.crt).
## 3
Set `ssl_certificate /etc/nginx/certs/fullchain.crt;` and reload.
