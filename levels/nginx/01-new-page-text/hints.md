## 1
The config nginx runs is a file on your machine: ~/.k8s-wargame/nginx/app/conf.d/default.conf (bind-mounted into the wg-nginx container). `grep -n 'coming soon'` there finds the line.
## 2
`return 200 "…";` is the fixed answer of that location. Editing the file changes nothing by itself — nginx keeps serving the config it read last, until it is told to re-read it.
## 3
Change the string to "new page\n", then `docker exec wg-nginx nginx -s reload`. Confirm: `curl -H 'Host: shop.local' http://127.0.0.1:8082/new`.
