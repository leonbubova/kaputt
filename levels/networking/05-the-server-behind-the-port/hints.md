## 1
A stopped server means a refused port. `pgrep nginx` tells you whether it runs; `nginx -s stop` stops it, plain `nginx` starts it.
## 2
Do both, in order: stop, then start. Then `curl -s http://localhost:8080/` must print `api ok`.
## 3
    nginx -s stop
    nginx
    curl -s http://localhost:8080/
