# package the landing page as an image
"Designers finished `index.html` (in `~/.k8s-wargame/docker/03-build-image/`). Ship it as an image so every environment gets the same page." Goal: write a `Dockerfile` there and build image `wg-site:1` that serves `index.html` with nginx on port 80 — `docker run --rm -p 18003:80 wg-site:1` must show the page at `curl localhost:18003`.
