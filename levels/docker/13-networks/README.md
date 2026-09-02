# app can't reach web
"In the compose stack (`~/.k8s-wargame/docker/13-networks/`), `wg-app` logs `bad address 'web'` every few seconds. Both containers are Running."
Goal: `docker exec wg-app wget -qO- http://web/` returns the nginx page. Keep the two networks (`wg-front`, `wg-back`) — the stack needs both.
