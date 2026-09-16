## 1
Every request leaves one line in `docker logs wg-nginx`. The number right after the closing quote of `"GET /path HTTP/1.1"` is the status code nginx answered.
## 2
    curl -H 'Host: shop.local' http://127.0.0.1:8082/missing-page
    docker logs --tail 3 wg-nginx
A path that is no file and no location is "not found" — that code goes into the notes file with `echo NUMBER > FILE`.
## 3
    curl -H 'Host: shop.local' http://127.0.0.1:8082/missing-page
    echo 404 > ~/.k8s-wargame/nginx/notes/status.txt
