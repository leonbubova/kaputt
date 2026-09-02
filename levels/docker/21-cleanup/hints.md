## 1
`docker system df` shows what's reclaimable. Then `docker images -f dangling=true`, `docker ps -a -f status=exited`, `docker volume ls -f dangling=true`.
## 2
`docker image prune` removes dangling (`<none>`) images only. Volumes in use by a container can't be removed — that protects `wg-web-data`.
## 3
`docker rm $(docker ps -aq -f name=^wg-old-)`, `docker volume rm $(docker volume ls -q -f name=^wg-old-)`, `docker image prune -f`. Avoid `system prune -a` on a shared host — it deletes every unused image.
