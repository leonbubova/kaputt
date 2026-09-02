# 502 means nginx answered but the upstream did not: read the status, then test the upstream yourself
Lesson: status codes tell you WHO failed. 404 and 403 are nginx's own decisions about a file. 502 Bad Gateway means the request reached a `proxy_pass` location, nginx tried to connect to the upstream, and got no valid answer — connection refused, wrong host, wrong port, backend dead.
So a 502 is fixed by asking two questions. Is the backend actually up? And does the `proxy_pass` target — host AND port — match where it listens? A config that passes `nginx -t` can still point at a port nobody listens on.
Split the two by bypassing nginx: talk to the upstream from inside the container network, then compare with what the config says.
    curl -s -o /dev/null -w '%{http_code}\n' -H 'Host: shop.local' http://127.0.0.1:8082/api/orders    just the status
    docker exec wg-nginx wget -qO- http://wg-backend:9000/       reach the upstream directly
    docker logs wg-nginx 2>&1 | tail                    error log names the failing connect
    grep -n proxy_pass ~/.k8s-wargame/nginx/app/conf.d/default.conf    what nginx thinks the target is
Try it first: the wget line — if the backend answers `backend ok`, the upstream is alive and the problem is between nginx and it.
Your task: nothing changed in the backend, yet the shop API stopped answering through nginx — every /api/ call returns 502 Bad Gateway. The static site still loads fine. Get /api/ talking to the upstream again.
Check yourself:  wg check      stuck?  wg hint
