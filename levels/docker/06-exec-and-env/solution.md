`-e GREETING=hello` sets the variable at start; `docker exec` reads it from inside.
    docker run -d --name wg-greet -e GREETING=hello alpine:3.20 sleep infinity
    docker exec wg-greet printenv GREETING
