curl fetches the page, `>` writes it into the file.
    mkdir -p ~/.k8s-wargame/nginx/notes; curl -H 'Host: shop.local' http://127.0.0.1:8082/ > ~/.k8s-wargame/nginx/notes/homepage.html
