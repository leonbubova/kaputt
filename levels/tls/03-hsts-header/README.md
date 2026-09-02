# HSTS is a response header that makes the browser refuse plain HTTP
Lesson: the redirect from the last level still has a gap: the very first request goes out in cleartext before the 301 arrives, and an attacker on that path can intercept it. HSTS (HTTP Strict Transport Security) closes the gap. The HTTPS server sends one header, `Strict-Transport-Security: max-age=N`, and the browser remembers for N seconds to rewrite every http:// URL for this host to https:// before sending anything.
It is only meaningful over HTTPS — browsers ignore the header on plain HTTP — so it belongs in the TLS server block, not the port-80 one.
nginx adds headers with `add_header`. By default that only applies to 2xx and 3xx responses; the `always` flag adds it to error responses too, which is what a security audit expects.
    add_header Strict-Transport-Security "max-age=31536000" always;   one year, on every response
    curl -skI https://127.0.0.1:9443/                                  response headers only
    docker exec wg-tls nginx -s reload                                 apply a header change
Try it first: `curl -skI https://127.0.0.1:9443/` — list the headers; note which security-related ones are there and which are not.
Your task: responses over HTTPS must carry a `Strict-Transport-Security` header so browsers pin HTTPS. Add it to the TLS server.
Check yourself:  wg check      stuck?  wg hint
