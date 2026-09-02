# live-edit the page without rebuilding
"Designers iterate on `~/.k8s-wargame/docker/04-bind-mount/site/` all day; rebuilding an image per change is too slow." Goal: container `wg-web` (`nginx:1.27-alpine`, host port 18004 → 80) serving that folder directly, so a change to `site/index.html` on the host shows up on `curl localhost:18004` immediately.
