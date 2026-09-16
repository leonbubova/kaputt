## 1
The container stops when its command ends. Give it a command that never ends, and `-d` so your prompt comes back.
## 2
Same shape as the Try-it line, with `infinity` instead of `20` and the name `wg-clock`.
## 3
    docker run -d --name wg-clock alpine:3.20 sleep infinity
    docker ps
