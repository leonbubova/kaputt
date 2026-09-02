# security audit: api runs as root
"Audit finding: process in `wg-api` runs as uid 0. Fix it in the image (`~/.k8s-wargame/docker/19-runs-as-root/`), not with a runtime flag — the image goes to other teams too."
Goal: `wg-api` running from a rebuilt `wg-api:1.0`, `docker exec wg-api id -u` is not 0, and the app still logs `api ready`. Don't change `app.sh`.
