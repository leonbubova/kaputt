The access log shows 404 for /missing-page.
    curl -H 'Host: shop.local' http://127.0.0.1:8082/missing-page; echo 404 > ~/.k8s-wargame/nginx/notes/status.txt
