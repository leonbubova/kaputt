RestartPolicy is `no`. Set one — works on the running container.
    docker update --restart=unless-stopped wg-worker && docker start wg-worker
