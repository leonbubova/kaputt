# reach inside — docker exec, and settings with -e
Lesson: `docker exec NAME COMMAND` runs one more command inside a running container, next to its main one.
`docker exec -it NAME sh` opens a shell in there: you are then "inside" — ls, cat, cd see the container's
files, not yours; `exit` brings you back. A container gets its settings as environment variables: name=value
pairs. Inside, `printenv` lists them; `printenv NAME` shows one. You add one when the container starts:
    docker exec NAME COMMAND        run COMMAND inside NAME
    docker exec -it NAME sh         a shell inside NAME (exit to leave)
    docker run -e NAME=value …      start with the environment variable NAME set to value
Try it (wg-box is running for you):
    docker exec wg-box ls /
    docker exec -it wg-box sh
    printenv
    exit
Your task: start a container `wg-greet` from `alpine:3.20` (background, `sleep infinity`) that has the
environment variable `GREETING` set to `hello`. Then `docker exec wg-greet printenv GREETING` must print `hello`.
Check yourself:  wg check      stuck?  wg hint
