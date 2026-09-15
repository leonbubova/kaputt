## 1
nginx doesn't push clients to HTTPS by itself: the port-80 server keeps serving cleartext until you tell it to answer with a redirect to the https URL instead. `curl -s -o /dev/null -w '%{http_code}' http://127.0.0.1:9080/` returns 200 — no redirect.
## 2
The port-80 server should return a permanent redirect to the https scheme.
## 3
In the listen-80 server: `return 301 https://$host$request_uri;` then reload.
