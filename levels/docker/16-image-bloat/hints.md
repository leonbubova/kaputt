## 1
`docker history wg-app:1.0` — which layer carries the weight? Then `du -sh ~/.k8s-wargame/docker/16-image-bloat/*` (and hidden dirs: `du -sh .[^.]*`).
## 2
`COPY . /app` copies the whole build context, including things you never wanted in the image.
## 3
Add a `.dockerignore` with `.cache/` (or COPY only `app.sh`), then `docker build -t wg-app:1.0 .`
