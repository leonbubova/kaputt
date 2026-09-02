## 1
Image size is the sum of its layers, one per Dockerfile instruction — a huge image with a tiny app means some instruction copied far more than the app. `docker history wg-app:1.0` shows which layer carries the weight; `du -sh ~/.k8s-wargame/docker/19-image-bloat/*` (and hidden dirs: `du -sh .[^.]*`) shows what was there to copy.
## 2
`COPY . /app` copies the whole build context, including things you never wanted in the image.
## 3
Add a `.dockerignore` with `.cache/` (or COPY only `app.sh`), then `docker build -t wg-app:1.0 .`
