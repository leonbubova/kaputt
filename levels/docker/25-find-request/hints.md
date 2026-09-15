## 1
nginx writes its access log to stdout: `docker logs wg-web`. Every line has the request, status and `rid=`.
## 2
Filter: `docker logs wg-web 2>&1 | grep checkout` — the failed one has a non-200 status.
## 3
`docker logs wg-web 2>&1 | grep 'GET /checkout' | grep ' 404 ' | grep -o 'rid=.*' | cut -d= -f2- > ~/.k8s-wargame/docker/25-find-request/answer.txt` (mind the error-log line — it has no `rid=`).
