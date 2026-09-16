`-d` detaches, `sleep infinity` never finishes, so the container stays Up.
    docker run -d --name wg-clock alpine:3.20 sleep infinity
