## 1
`docker run` starts a container from an image. `-d` detaches (runs in background), `--name` names it, `-p HOST:CONTAINER` publishes a port.
## 2
nginx listens on port 80 inside the container. You want host 18001 → container 80: `-p 18001:80`.
## 3
`docker run -d --name wg-web -p 18001:80 nginx:1.27-alpine` — then `docker ps` and `curl localhost:18001`.
