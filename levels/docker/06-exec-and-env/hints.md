## 1
Environment variables are set when the container starts, with `-e NAME=value` on `docker run`. Afterwards `docker exec … printenv NAME` reads it back.
## 2
Lesson 3's command plus one flag: `docker run -d --name wg-greet -e GREETING=hello alpine:3.20 sleep infinity`.
## 3
    docker run -d --name wg-greet -e GREETING=hello alpine:3.20 sleep infinity
    docker exec wg-greet printenv GREETING
