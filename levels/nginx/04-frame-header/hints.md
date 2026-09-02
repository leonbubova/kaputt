## 1
Check the response headers: `curl -sI -H 'Host: shop.local' http://127.0.0.1:8082/`. No X-Frame-Options.
## 2
`add_header` sets a response header. Put it at server level so it applies to every location.
## 3
Add `add_header X-Frame-Options DENY;` inside the server block and reload.
