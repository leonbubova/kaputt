## 1
nginx picks one `location` per request — the most specific match. /health has none, so it falls into the catch-all `location /`, where try_files hands out index.html. Confirm in conf.d/default.conf on the shop.local server.
## 2
A location that returns a fixed string uses `return`. Set default_type text/plain so it is served as plain text.
## 3
Add inside the server: `location = /health { default_type text/plain; return 200 "ok\n"; }` then `docker exec wg-nginx nginx -s reload`.
