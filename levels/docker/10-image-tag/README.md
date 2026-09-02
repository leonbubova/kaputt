# compose up fails for the cache service
"`docker compose up -d` in the new stack errors out and `wg-cache` never appears. `wg-web` is fine."
Goal: both `wg-web` and `wg-cache` (a redis 7) running from the compose file in `~/.k8s-wargame/docker/10-image-tag/`, and `docker exec wg-cache redis-cli ping` answers PONG.
