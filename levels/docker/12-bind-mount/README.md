# static site returns 403
"`wg-web` should serve our landing page from `~/.k8s-wargame/docker/12-bind-mount/site/` so designers can edit it live. `curl localhost:18011` → 403 Forbidden."
Goal: `http://localhost:18011/` shows the landing page and edits in `site/` are visible without rebuild or copy (keep it a bind mount).
