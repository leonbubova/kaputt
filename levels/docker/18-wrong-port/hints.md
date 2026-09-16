## 1
A port mapping is a blind forward: Docker sends host-port traffic to the container port you named, whether or not anything listens there. 'Connection reset' = the forward worked, nobody answered inside. `docker port wg-web` shows the mapping; `docker exec wg-web netstat -tln` or `docker logs wg-web` show where nginx really listens.
## 2
`-p HOST:CONTAINER`. The container side must be the port the process listens on. nginx listens on 80.
## 3
Port mappings can't be changed on a running container: `docker rm -f wg-web && docker run -d --name wg-web -p 18009:80 nginx:1.27-alpine`.
