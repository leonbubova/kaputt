## 1
nginx serves what its config says and nothing else: the file is ~/.k8s-wargame/tls/app/conf.d/default.conf (mounted into wg-tls), and inside a `server { }` block each `location` decides what a path returns. `curl -s -o /dev/null -w '%{http_code}' http://127.0.0.1:9080/health` gives 404 — no location matches.
## 2
A location can answer directly: `location /health { return 200 "ok\n"; }` inside the `listen 80` server. nginx only reads the file when told to — `docker exec wg-tls nginx -t` checks it, `nginx -s reload` applies it.
## 3
Add `location /health { default_type text/plain; return 200 "ok\n"; }` to the listen-80 server, then `docker exec wg-tls nginx -s reload`.
