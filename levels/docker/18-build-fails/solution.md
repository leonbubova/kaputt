`COPY entrypiont.sh` — the file is called `entrypoint.sh`.
    cd ~/.k8s-wargame/docker/18-build-fails && sed -i '' 's/entrypiont/entrypoint/' Dockerfile && docker build -t wg-tool:1.0 .
