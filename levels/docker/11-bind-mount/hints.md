## 1
403 from nginx with a bind mount usually means: directory is there but empty (no index.html). `docker exec wg-web ls /usr/share/nginx/html`.
## 2
Where does that mount come from? `docker inspect wg-web --format '{{json .Mounts}}'` — compare the host path with `ls ~/.k8s-wargame/docker/11-bind-mount/`. Docker silently creates a missing host dir.
## 3
`docker rm -f wg-web && docker run -d --name wg-web -p 18011:80 -v ~/.k8s-wargame/docker/11-bind-mount/site:/usr/share/nginx/html:ro nginx:1.27-alpine`
