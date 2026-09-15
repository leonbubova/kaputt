## 1
Unless the image says otherwise, the process starts as root. `docker run --rm wg-tool:2 id` shows it. The Dockerfile can create a user and switch to it.
## 2
`RUN` executes a command at build time in the image (alpine: `adduser -D -u 10001 app` creates a user without password). `USER app` makes every later instruction and the container's process run as that user.
## 3
Add `RUN adduser -D -u 10001 app` and `USER app` before `CMD`, then `docker build -t wg-tool:2 .` in the work dir and `docker run --rm wg-tool:2 id -u`.
