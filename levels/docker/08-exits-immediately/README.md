# a container that vanished ran its command and finished: exit code and logs tell you why
Lesson: `docker run` reports success when the container *started*. What the main process did afterwards is a separate story. If it ended — finished its job, crashed, could not find a program — the container exits, and `docker ps` no longer lists it. Nothing is wrong with Docker; the process is simply over.
Two things survive an exited container. Its exit code: 0 means the command finished normally, anything else means it failed, and 127 specifically means "command not found". And its output: everything the process printed to stdout/stderr is kept in `docker logs` until the container is removed. Read the logs before touching anything else — the process usually says exactly what went wrong.
    docker ps -a                          all containers, exited ones with their exit code
    docker logs n                         what the process printed before it died
    docker inspect -f '{{.Config.Cmd}}' n   the exact command the container was started with
    docker rm -f n                        remove it so you can recreate it with the same name
Try it first: `docker run --name wg-t alpine:3.20 false; docker ps -a | grep wg-t; docker rm wg-t` — exited (1), by design.
Your task: "We start `wg-worker` from `alpine:3.20`, `docker ps` shows nothing a second later. No error on `docker run`."
Goal: a container named `wg-worker` (image `alpine:3.20`) that stays running and prints `worker ready` at startup.
Check yourself:  wg check      stuck?  wg hint
