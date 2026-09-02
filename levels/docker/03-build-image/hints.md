## 1
A Dockerfile starts `FROM` a base image and adds files with `COPY`. nginx images serve `/usr/share/nginx/html/`.
## 2
Two lines are enough: `FROM nginx:1.27-alpine` and `COPY index.html /usr/share/nginx/html/index.html`. The base image already exposes 80 and starts nginx.
## 3
`cd ~/.k8s-wargame/docker/03-build-image && docker build -t wg-site:1 .` — the `.` is the build context (the directory `COPY` reads from). Test: `docker run --rm -p 18003:80 wg-site:1`.
