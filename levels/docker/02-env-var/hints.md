## 1
`-e KEY=value` on `docker run` sets an environment variable inside the container. A container needs a long-running main process, otherwise it exits at once.
## 2
`alpine:3.20` has no default daemon. Give it a command: `sleep infinity`.
## 3
`docker run -d --name wg-app -e REGION=eu-central alpine:3.20 sleep infinity` — verify with `docker exec wg-app printenv REGION` (`docker exec` runs a command inside a running container).
