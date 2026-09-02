## 1
`docker ps -a` shows exited containers too. Look at the exit code of `wg-worker`.
## 2
A container lives as long as its main process. Read what it said before dying: `docker logs wg-worker`.
## 3
The start command has a typo (`ehco`). Recreate: `docker rm -f wg-worker && docker run -d --name wg-worker alpine:3.20 sh -c 'echo "worker ready"; sleep infinity'`.
