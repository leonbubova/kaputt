# handing a request to another program: proxy_pass
Lesson: nginx rarely does all the work itself. Often it sits in front of another program (an upstream, or backend)
and passes requests on: the browser talks to nginx, nginx talks to the backend, the backend's answer comes back
through nginx. That is a reverse proxy. A location does it with one line:
    location /shop/ {
        proxy_pass http://wg-backend:9000/;
    }
wg-backend is a second box next to wg-nginx, reachable by that name on port 9000. The trailing `/` on both matters:
`/shop/` is cut off and the rest is sent — a request for /shop/orders arrives at the backend as /orders.
Try it — ask the backend directly, from inside the nginx box:
    docker exec wg-nginx wget -qO- http://wg-backend:9000/orders
It answers `orders=[]`. From your machine it is unreachable — only nginx can see it. Now the existing /api/
location in default.conf does exactly this hand-off; look at it:
    curl -H 'Host: shop.local' http://127.0.0.1:8082/api/orders
Your task: add a second hand-off — the /shop/ block above — inside the server block of
`~/.k8s-wargame/nginx/app/conf.d/default.conf`, then `nginx -t` and reload, so that
    curl -H 'Host: shop.local' http://127.0.0.1:8082/shop/orders
prints `orders=[]`.
File: ~/.k8s-wargame/nginx/app/conf.d/default.conf. Test: `docker exec wg-nginx nginx -t`. Apply: `docker exec wg-nginx nginx -s reload`.
Check yourself:  wg check      stuck?  wg hint
