# a request picks one location, and `return` answers it without a file
Lesson: nginx handles every request in two steps. First it picks a `server` block by the Host header, then inside that server it picks exactly ONE `location` block — the most specific match for the path. Whatever that location says is what happens.
`location /` is a prefix match: it catches everything that no better block claims. `location = /path` is an exact match and always wins for that one path. That is how you carve a single URL out of the catch-all.
A location does not have to serve a file. `return CODE "text";` sends a fixed answer straight from the config. Add `default_type text/plain;` so the client sees plain text.
    location = /health { ... }                          exact match: only this path
    default_type text/plain;                            content-type for a fixed answer
    return 200 "ok\n";                                  answer with a status and body
    docker exec wg-nginx nginx -s reload                apply the edit
Try it first: `curl -H 'Host: shop.local' http://127.0.0.1:8082/new` — /new is an exact-match location that answers with `return`; read it in conf.d/default.conf and compare with `location /`.
Your task: the load balancer probes http://shop.local/health and expects the body "ok". Right now it gets the HTML index page, so the probe is failing. Add a /health endpoint on the shop.local server that returns 200 with the plain body "ok".
Check yourself:  wg check      stuck?  wg hint
