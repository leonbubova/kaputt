    # Dockerfile, before CMD:   RUN adduser -D -u 10001 app   /   USER app
    cd ~/.k8s-wargame/docker/23-non-root-image && docker build -t wg-tool:2 .
