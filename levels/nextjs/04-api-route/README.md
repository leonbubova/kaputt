# add GET /api/ping
"The load balancer needs a cheap health probe: `GET /api/ping` → JSON `{"ok":true}` with status 200. Other methods may 405."
App: `~/.k8s-wargame/nextjs/app`. Goal: `curl localhost:3100/api/ping` prints `{"ok":true}`.
