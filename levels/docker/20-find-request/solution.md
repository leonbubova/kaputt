The access log (stdout) carries `rid=<X-Request-Id>`; the one `GET /checkout` returned 404.
    docker logs wg-web 2>&1 | grep 'GET /checkout' | grep ' 404 ' | grep -o 'rid=.*' | cut -d= -f2- > ~/.k8s-wargame/docker/20-find-request/answer.txt
