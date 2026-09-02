## 1
There is no `location /api/` block anymore. The backend runs at http://wg-backend:9000 on the wg-nginx-net network.
## 2
`proxy_pass` with a trailing slash strips the /api/ prefix, so /api/orders becomes /orders upstream.
## 3
Add `location /api/ { proxy_pass http://wg-backend:9000/; proxy_set_header Host $host; }` then reload.
