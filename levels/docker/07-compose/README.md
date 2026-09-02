# compose describes a whole stack in one file and starts it with one command
Lesson: every `docker run` flag you used — image, name, ports, volumes, network — is a fact about a container. Compose puts those facts in a YAML file instead of a shell history, so the stack is versioned and everyone starts it the same way.
The file has a top-level `services:` key; each child is one container. `image:` says what to run, `container_name:` fixes the name, `ports:` is a list of `"HOST:CONTAINER"` strings. Compose also creates a network for the stack, so services reach each other by service name — the previous level, for free.
A stack has a project name: `-p wg` on the command line or `name: wg` at the top of the file. Every container it creates carries it as a label; `compose ps`/`down` use it to find them.
    services:                        top-level key, one child per container
      web:
        image: nginx:1.27-alpine
        ports: ["8080:80"]
    docker compose -p wg up -d       create and start the stack, detached
    docker compose -p wg ps          the stack's containers
Your task: "New devs need `web` + `cache` up with one command, not a page of docker runs." Goal: a `compose.yaml` in `~/.k8s-wargame/docker/07-compose/` with services `web` (`nginx:1.27-alpine`, container `wg-web`, host 18007 → 80) and `cache` (`redis:7-alpine`, container `wg-cache`), started with project name `wg` (`docker compose -p wg up -d`). `curl localhost:18007` answers, `docker exec wg-cache redis-cli ping` says PONG.
Check yourself:  wg check      stuck?  wg hint
