# a Dockerfile builds your own image: FROM a base, COPY your files in
Lesson: so far you ran images other people built. A Dockerfile is the recipe for your own: a text file of instructions, each adding a layer on the previous. `FROM` picks the base image — you inherit its files, exposed ports and start command. `COPY src dst` copies files from your directory into the image.
`docker build -t name:tag DIR` runs the recipe. DIR is the build context: the folder sent to the builder, the only place `COPY` can read from. `-t` names the result so you can `docker run` it; the tag after the colon is a version label you choose.
The base image already knows how to serve: nginx images start nginx and serve whatever is in `/usr/share/nginx/html/`. Your image only has to put the page there.
    FROM nginx:1.27-alpine                  first line of a Dockerfile: the base
    COPY index.html /usr/share/nginx/html/  copy from the build context into the image
    docker build -t wg-site:1 .             build the Dockerfile in this dir, tag it
Your task: "Designers finished `index.html` (in `~/.k8s-wargame/docker/03-build-image/`). Ship it as an image so every environment gets the same page." Goal: write a `Dockerfile` there and build image `wg-site:1` that serves `index.html` with nginx on port 80 — `docker run --rm -p 18003:80 wg-site:1` must show the page at `curl localhost:18003`.
Check yourself:  wg check      stuck?  wg hint
