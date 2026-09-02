Mounted `.../stie` (typo) — Docker created it empty, nginx has nothing to index → 403.
    docker rm -f wg-web && docker run -d --name wg-web -p 18011:80 -v ~/.k8s-wargame/docker/11-bind-mount/site:/usr/share/nginx/html:ro nginx:1.27-alpine
