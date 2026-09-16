## 1
nginx lives inside a container, and a container that isn't running serves nothing — `curl -k https://127.0.0.1:9443/` can't even connect. `docker ps` lists only running containers; `docker ps -a` also shows the stopped ones, with their status (Exited …).
## 2
A stopped container keeps everything — image, mounts, published ports. It doesn't need to be recreated, only started.
## 3
`docker start wg-tls`, then `curl -k https://127.0.0.1:9443/`.
