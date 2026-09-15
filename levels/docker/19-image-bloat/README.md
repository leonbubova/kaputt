# tiny shell app ships as a 70 MB image
"`wg-app:1.0` is a 20-line shell script on alpine but the image is huge and pushes take forever. Build context is `~/.k8s-wargame/docker/19-image-bloat/`."
Goal: rebuild `wg-app:1.0` under 20 MB; `docker run --rm wg-app:1.0` still prints `app ok`. Don't delete the `.cache/` dir — the build server needs it.
