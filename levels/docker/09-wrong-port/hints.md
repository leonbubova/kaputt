## 1
`docker port wg-web` — host port → which container port? Is that where nginx listens? (`docker exec wg-web netstat -tln` or `docker logs wg-web`).
## 2
`-p HOST:CONTAINER`. The container side must be the port the process listens on. nginx listens on 80.
## 3
Port mappings can't be changed on a running container: `docker rm -f wg-web && docker run -d --name wg-web -p 18009:80 nginx:1.27-alpine`.
