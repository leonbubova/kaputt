## 1
nginx only proxies what a `location` tells it to proxy — a path with no matching block is served as a static file from `root`. There is no `location /api/` block anymore, so /api/orders is just a missing file. The backend runs at http://wg-backend:9000 on the wg-nginx-net network.
## 2
`proxy_pass` with a trailing slash strips the /api/ prefix, so /api/orders becomes /orders upstream.
## 3
Add `location /api/ { proxy_pass http://wg-backend:9000/; proxy_set_header Host $host; }` then reload.
