# a bind mount never fails: a missing host path is created empty, silently
Lesson: `-v /host/path:/ctr/path` is trusted as typed. If the host path does not exist, Docker does not complain — it creates an empty directory there and mounts that. The container starts fine, the mount "works", and the process inside sees an empty folder where it expected files.
For a web server that shows up as 403: the document root exists, so no 404, but there is no `index.html` and directory listing is off, so nginx refuses. Any "files are not there" symptom on a mounted container gets two questions: what does the container see at that path, and which host path is really mounted there.
`docker inspect` lists every mount with `Source` (host) and `Destination` (container). Compare the source with the directory you meant, character by character. Mounts, like ports, cannot be changed on a running container — recreate it.
    docker exec n ls -la /ctr/path                        what the container sees at the path
    docker inspect -f '{{range .Mounts}}{{.Source}} -> {{.Destination}}{{"\n"}}{{end}}' n    real mounts
    docker rm -f n && docker run ... -v /host:/ctr:ro img    recreate with the right path
Your task: "`wg-web` should serve our landing page from `~/.k8s-wargame/docker/11-bind-mount/site/` so designers can edit it live. `curl localhost:18011` → 403 Forbidden."
Goal: `http://localhost:18011/` shows the landing page and edits in `site/` are visible without rebuild or copy (keep it a bind mount).
Check yourself:  wg check      stuck?  wg hint
