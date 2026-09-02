## 1
A bind mount maps a host directory into the container: `-v /host/path:/container/path`. Changes are visible on both sides instantly.
## 2
nginx serves `/usr/share/nginx/html`. Mount the `site/` folder there (`:ro` is fine — nginx only reads).
## 3
`docker run -d --name wg-web -p 18004:80 -v ~/.k8s-wargame/docker/04-bind-mount/site:/usr/share/nginx/html:ro nginx:1.27-alpine` — then edit `site/index.html` and curl again.
