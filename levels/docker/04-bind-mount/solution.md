    docker run -d --name wg-web -p 18004:80 -v ~/.k8s-wargame/docker/04-bind-mount/site:/usr/share/nginx/html:ro nginx:1.27-alpine
