## 1
nginx adds nothing to a response on its own: every extra header comes from an explicit `add_header` in the config, and if that line is gone the header is gone. See for yourself: `curl -sI -H 'Host: shop.local' http://127.0.0.1:8082/` — no X-Frame-Options.
## 2
`add_header` sets a response header. Put it at server level so it applies to every location.
## 3
Add `add_header X-Frame-Options DENY;` inside the server block and reload.
