    printf 'FROM nginx:1.27-alpine\nCOPY index.html /usr/share/nginx/html/index.html\n' > ~/.k8s-wargame/docker/03-build-image/Dockerfile
    docker build -t wg-site:1 ~/.k8s-wargame/docker/03-build-image
