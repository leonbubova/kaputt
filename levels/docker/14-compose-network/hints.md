## 1
Compose can create networks the same way `docker network create` does: a top-level `networks:` block declares them, and each service lists the ones it joins under its own `networks:` key.
## 2
Compose prefixes network names with the project (`wg_back`). To get exactly `wg-back`, give the network a `name:`:
```
networks:
  back: {name: wg-back}
```
and `networks: [back]` on both services.
## 3
Edit `compose.yaml`, then `docker compose up -d` in the work dir — it recreates the containers on the new network. Check with `docker network inspect wg-back`.
