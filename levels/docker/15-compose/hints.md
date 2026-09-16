## 1
Compose describes containers in YAML: top-level `services:`, one key per service with `image:`, optional `container_name:`, `ports:` (list of `"HOST:CONTAINER"`).
## 2
```
services:
  web:   {image: nginx:1.27-alpine, container_name: wg-web, ports: ["18007:80"]}
  cache: {image: redis:7-alpine, container_name: wg-cache}
```
## 3
From the work dir: `docker compose -p wg up -d` (`-p` sets the project name; `name: wg` at the top of the file does the same). `docker compose -p wg ps` shows the stack.
