# add a location — and test the config first
Lesson: a new path is a new `location` block inside the `server { }` of default.conf. The smallest one answers a
fixed text:
    location = /ping {
        default_type text/plain;
        return 200 "pong\n";
    }
`default_type text/plain;` says "this is plain text, not HTML". Before you reload, ask nginx whether the file is
valid — a typo, a missing `;` or brace makes reload silently keep the old config:
    docker exec wg-nginx nginx -t
"syntax is ok … test is successful" means go ahead. Otherwise it prints the file and line number of the problem.
Try it: run `nginx -t` now, on the untouched file, and read the two lines it prints.
Your task: add the /ping block above inside the server block of `~/.k8s-wargame/nginx/app/conf.d/default.conf`
(a good place: right after the `index index.html;` line). Then `nginx -t`, then reload.
    curl -H 'Host: shop.local' http://127.0.0.1:8082/ping
must print `pong`.
File: ~/.k8s-wargame/nginx/app/conf.d/default.conf. Test: `docker exec wg-nginx nginx -t`. Apply: `docker exec wg-nginx nginx -s reload`.
Check yourself:  wg check      stuck?  wg hint
