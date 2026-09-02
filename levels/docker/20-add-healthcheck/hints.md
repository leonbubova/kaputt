## 1
A healthcheck is a command Docker runs inside the container on an interval; exit 0 = healthy. `docker ps` shows the status in parentheses, `docker inspect --format '{{json .State.Health}}' wg-web` shows every probe result.
## 2
In compose, per service:
```
healthcheck:
  test: ["CMD", "wget", "-qO-", "http://localhost/"]
  interval: 2s
  timeout: 2s
  retries: 3
```
The nginx alpine image has `wget` (busybox), not `curl`.
## 3
`docker compose up -d` in the work dir recreates `wg-web`; after a few seconds `docker ps` shows `(healthy)`.
