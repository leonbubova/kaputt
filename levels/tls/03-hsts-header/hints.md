## 1
HSTS is nothing more than a response header: the server tells the browser "only ever talk HTTPS to me for N seconds" and the browser remembers. If the TLS server never adds it, it isn't there — `curl -skI https://127.0.0.1:9443/` shows no Strict-Transport-Security header.
## 2
`add_header Strict-Transport-Security "..." always;` sets it on the TLS server.
## 3
Add `add_header Strict-Transport-Security "max-age=31536000" always;` and reload.
