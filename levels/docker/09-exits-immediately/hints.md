## 1
A container lives exactly as long as its main process — when that command ends, the container exits, and `docker run` still reports success because the *start* worked. `docker ps -a` shows exited containers too; look at the exit code of `wg-worker`.
## 2
A non-zero exit code means the process failed, not Docker. Read what it said before dying: `docker logs wg-worker`.
## 3
The start command has a typo (`ehco`). Recreate: `docker rm -f wg-worker && docker run -d --name wg-worker alpine:3.20 sh -c 'echo "worker ready"; sleep infinity'`.
