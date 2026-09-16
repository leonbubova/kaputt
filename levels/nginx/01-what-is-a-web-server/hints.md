## 1
`curl URL` asks the server and prints the answer. `-H 'Host: shop.local'` tells nginx which site you mean; without it you get a 404 page.
## 2
`>` sends the printed answer into a file instead of the screen (shell track, lesson 1). The folder must exist first: `mkdir -p ~/.k8s-wargame/nginx/notes`.
## 3
    mkdir -p ~/.k8s-wargame/nginx/notes
    curl -H 'Host: shop.local' http://127.0.0.1:8082/ > ~/.k8s-wargame/nginx/notes/homepage.html
