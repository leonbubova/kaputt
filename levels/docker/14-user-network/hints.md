## 1
The default bridge has no name resolution. A user-defined network does: `docker network create wg-net`.
## 2
Attach at start with `--network wg-net`. Container names become DNS names on that network.
## 3
`docker run -d --name wg-b --network wg-net nginx:1.27-alpine` and `docker run -d --name wg-a --network wg-net busybox:1.36 sleep infinity`, then `docker exec wg-a wget -qO- http://wg-b/`.
