# reading the log
Lesson: nginx writes one line per request it answered — the access log — and complaints about itself — the error
log. Inside the wg-nginx box both go to the container's output, which you read with:
    docker logs wg-nginx
An access line looks like this (one request, left to right: who asked, when, what, and the status code nginx answered):
    172.18.0.1 - - [16/Sep/2026:10:00:00 +0000] "GET /health HTTP/1.1" 200 6 "-" "curl/8.4.0"
`"GET /health HTTP/1.1"` is the request, `200` the status. Status codes you will meet: 200 = fine, 301 = go elsewhere,
404 = not found, 502 = the program behind nginx did not answer. Error-log lines start with a date and `[error]` or `[emerg]`.
Try it:
    curl -H 'Host: shop.local' http://127.0.0.1:8082/health
    docker logs wg-nginx
The last line is your request. `docker logs --tail 5 wg-nginx` shows only the last 5 lines.
Your task: request the path `/missing-page` with curl (same shape as above), then find that request in the log and
write the status code nginx answered — just the number — into `~/.k8s-wargame/nginx/notes/status.txt`.
Work in your normal terminal.
Check yourself:  wg check      stuck?  wg hint
