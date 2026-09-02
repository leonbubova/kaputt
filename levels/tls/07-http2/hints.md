## 1
`curl -sk --http2 -w '%{http_version}' https://127.0.0.1:9443/` reports 1.1 — no HTTP/2.
## 2
nginx enables it with the `http2 on;` directive in the TLS server block (nginx 1.25+).
## 3
Add `http2 on;` to the `listen 443 ssl` server and reload.
