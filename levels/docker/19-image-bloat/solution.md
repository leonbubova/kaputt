`COPY . /app` pulls a 60 MB `.cache/` into the image.
    cd ~/.k8s-wargame/docker/19-image-bloat && echo ".cache/" > .dockerignore && docker build -t wg-app:1.0 .
