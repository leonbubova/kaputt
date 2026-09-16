## 1
`docker ps -a` shows both. A running one must be stopped before `docker rm` accepts it; a stopped one can be removed straight away.
## 2
`docker stop wg-old` then `docker rm wg-old`; `docker rm wg-done`. Or `docker rm -f NAME` for either.
## 3
    docker stop wg-old
    docker rm wg-old wg-done
    docker ps -a
