## 1
HTTP/2 is negotiated inside the TLS handshake (ALPN): the client offers `h2`, and the server only accepts if it's configured to speak it — otherwise both silently fall back to HTTP/1.1. `curl -sk --http2 -w '%{http_version}' https://127.0.0.1:9443/` reports 1.1 — no HTTP/2.
## 2
nginx enables it with the `http2 on;` directive in the TLS server block (nginx 1.25+).
## 3
Add `http2 on;` to the `listen 443 ssl` server and reload.
