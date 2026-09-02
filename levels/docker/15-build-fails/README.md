# CI can't build the tool image
"`docker build -t wg-tool:1.0 .` in `~/.k8s-wargame/docker/15-build-fails/` fails since the last commit. Nobody touched the code."
Goal: `docker run --rm wg-tool:1.0` prints `tool v1.0 ok`. Keep `entrypoint.sh` and the base image as they are.
