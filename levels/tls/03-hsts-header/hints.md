## 1
`curl -skI https://127.0.0.1:9443/` shows no Strict-Transport-Security header.
## 2
`add_header Strict-Transport-Security "..." always;` sets it on the TLS server.
## 3
Add `add_header Strict-Transport-Security "max-age=31536000" always;` and reload.
