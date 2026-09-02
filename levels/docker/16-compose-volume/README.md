# the notes service needs persistent storage
"`wg-notes` (compose stack in `~/.k8s-wargame/docker/16-compose-volume/`) loses `/notes` on every redeploy; we want a named volume `wg-notes`, declared in the compose file." Goal: `wg-notes` has volume `wg-notes` mounted at `/notes`, and a file written there survives `docker compose down && docker compose up -d`.
