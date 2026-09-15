# ops wants to see whether web is actually healthy
"`docker ps` says Up for `wg-web` even when nginx is wedged. We need a real health status." Goal: in `~/.k8s-wargame/docker/20-add-healthcheck/compose.yaml`, give `web` a healthcheck that fetches `http://localhost/` from inside the container every 2 s, so `docker ps` shows `wg-web` as `(healthy)`.
