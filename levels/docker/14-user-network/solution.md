    docker network create wg-net
    docker run -d --name wg-b --network wg-net nginx:1.27-alpine
    docker run -d --name wg-a --network wg-net busybox:1.36 sleep infinity
