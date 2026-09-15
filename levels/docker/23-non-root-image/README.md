# new policy: images must not run as root
"Platform team rejects every image whose process starts as uid 0. Our tool image in `~/.k8s-wargame/docker/23-non-root-image/` is the first to be fixed." Goal: rebuild `wg-tool:2` so a container from it runs as a non-root user baked into the image — `docker run --rm wg-tool:2 id -u` is not 0, with no runtime flags.
