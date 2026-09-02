## 1
Look at conf.d/default.conf on the shop.local server. There is no location for /health, so it falls through to try_files and serves index.html.
## 2
A location that returns a fixed string uses `return`. Set default_type text/plain so it is served as plain text.
## 3
Add inside the server: `location = /health { default_type text/plain; return 200 "ok\n"; }` then `docker exec wg-nginx nginx -s reload`.
