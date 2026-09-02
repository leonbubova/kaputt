# add_header sets response headers, and where you put it decides which responses get it
Lesson: nginx adds nothing to a response by itself. Every extra header — security headers, cache hints, CORS — comes from an explicit `add_header NAME value;` in the config. Remove the line, the header is gone from every response.
Directives live in a context: `http`, `server`, or `location`. Most are inherited downwards, so a line in `server` applies to every location inside it. `add_header` has a catch: if a location has its own `add_header`, it replaces ALL inherited ones instead of adding to them. So the server level is the place for a header that must appear everywhere.
Headers are only visible on the wire. `curl -I` asks for headers only and shows exactly what a scanner or browser sees.
    add_header X-Frame-Options DENY;                    one response header on every reply
    curl -sI -H 'Host: shop.local' http://127.0.0.1:8082/       show the response headers
    curl -sI ... | grep -i frame                        pick one header out
    docker exec wg-nginx nginx -s reload                apply
Try it first: `curl -sI -H 'Host: shop.local' http://127.0.0.1:8082/` — every line after the status is a header some directive produced; find which config line each one comes from.
Your task: the scanner flags every page on http://shop.local for clickjacking protection. Responses must include the header `X-Frame-Options: DENY`. Add it on the shop.local server.
Check yourself:  wg check      stuck?  wg hint
