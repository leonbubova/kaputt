`docker logs wg-worker` → `sh: ehco: not found`; the shell exits with 127 and the container with it.
    docker rm -f wg-worker && docker run -d --name wg-worker alpine:3.20 sh -c 'echo "worker ready"; exec sleep infinity'
