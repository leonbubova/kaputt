# proxy_pass hands a path to an upstream, and its trailing slash rewrites the prefix
Lesson: nginx's third kind of answer, after "serve a file" and "return", is "ask someone else". `proxy_pass http://host:port/;` forwards the request to that upstream and streams the reply back. Only a location with `proxy_pass` proxies — every other path is still looked up on disk under `root`.
The trailing slash matters. `proxy_pass http://wg-backend:9000/;` (with slash) strips the matched location prefix: /api/orders becomes /orders upstream. Without the slash the full path /api/orders is passed through unchanged. Which one is right depends on what the backend expects.
By default nginx sends the upstream's hostname as Host. `proxy_set_header Host $host;` keeps the original Host so the backend knows which site it is serving.
    location /api/ { ... }                              prefix match for everything under /api/
    proxy_pass http://wg-backend:9000/;                 forward, strip /api/
    proxy_set_header Host $host;                        keep the original Host
    docker exec wg-nginx wget -qO- http://wg-backend:9000/    is the upstream reachable from inside?
Try it first: run the wget line above — the backend answers `backend ok` on its root, so the only question is whether nginx hands requests to it.
Your task: the frontend calls /api/orders and expects the upstream (wg-backend:9000) to answer. Right now nothing proxies /api/, so the requests fall through to the static site. Add a location that proxies /api/ to http://wg-backend:9000/ (note the trailing slash).
Check yourself:  wg check      stuck?  wg hint
