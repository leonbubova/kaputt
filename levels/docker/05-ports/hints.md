## 1
The server listens on 80 inside. Your machine needs a door to it: `-p HOSTPORT:80`. Flags go before the image name.
## 2
`docker run -d --name wg-page -p 18105:80 IMAGE` — the image is `nginx:1.27-alpine`; no command needed, the image has one.
## 3
    docker run -d --name wg-page -p 18105:80 nginx:1.27-alpine
    curl localhost:18105
