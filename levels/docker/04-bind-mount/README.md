# a bind mount shares a host directory with the container, live
Lesson: files copied into an image are frozen at build time. For files that change constantly — source code, a page being edited — you do not rebuild, you mount: `-v /host/dir:/container/dir` makes a host directory appear inside the container at that path. It is the same directory, not a copy: a change on one side is visible on the other instantly.
This is a bind mount, and the mount hides whatever the image had at that path. Mount your folder over `/usr/share/nginx/html` and nginx serves your files instead of its welcome page.
Add `:ro` to mount read-only when the container only needs to read — nginx never writes its own pages, so the container cannot mess up the host folder.
    docker run -d -v /host/dir:/ctr/dir img       bind-mount a host directory into the container
    -v /host/dir:/ctr/dir:ro                      same, read-only from inside
    docker inspect -f '{{json .Mounts}}' n        what is mounted where
    docker exec n ls /ctr/dir                     check the files from inside
Try it first: `docker run --rm -v /etc:/host-etc:ro alpine:3.20 ls /host-etc` — your host's /etc, seen from inside a container.
Your task: "Designers iterate on `~/.k8s-wargame/docker/04-bind-mount/site/` all day; rebuilding an image per change is too slow." Goal: container `wg-web` (`nginx:1.27-alpine`, host port 18004 → 80) serving that folder directly, so a change to `site/index.html` on the host shows up on `curl localhost:18004` immediately.
Check yourself:  wg check      stuck?  wg hint
