## 1
`docker inspect wg-db --format '{{json .State.Health}}'` — the health log contains the output of every failed probe.
## 2
The probe runs *inside* the container. Does redis listen where the probe looks? `docker exec wg-db redis-cli ping` works — what's different?
## 3
Fix the port in the healthcheck (`redis-cli ping`, default 6379), then `docker compose up -d`.
