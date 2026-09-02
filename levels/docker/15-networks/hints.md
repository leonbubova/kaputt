## 1
Containers only resolve each other's names on a shared network. `docker network inspect wg-front` and `wg-back` — who is where?
## 2
A service can be on several networks: `networks: [front, back]` on one of the services in `compose.yaml`.
## 3
Edit `compose.yaml`, then `docker compose up -d` (in the work dir) recreates only what changed. Verify: `docker exec wg-app wget -qO- http://web/`.
