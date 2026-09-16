# what a web server is — and how to talk to it
Lesson: a web server is a program that waits for requests and answers them. A browser sends "give me /" and the
server sends back a page. nginx (say "engine-x") is one such program. Yours is already running on your machine
and listens at address 127.0.0.1, door number (port) 8082. `curl` is a browser without a screen: it sends one
request and prints the answer in the terminal. Your nginx serves more than one site name, so every request
also carries the name you mean — the `Host` header. Here that name is always shop.local.
Try it:
    curl -H 'Host: shop.local' http://127.0.0.1:8082/
You get the homepage as raw HTML — the text a browser would render. Now ask for a path that does not exist:
    curl -H 'Host: shop.local' http://127.0.0.1:8082/health
This one answers a plain `ok` — the server decides what each path gets.
Your task: save the homepage into a file. Same curl as above, its output sent into `~/.k8s-wargame/nginx/notes/homepage.html`
(create the notes folder first: `mkdir -p ~/.k8s-wargame/nginx/notes`). The file must contain the line with "Welcome to shop.local".
Work in your normal terminal — nginx keeps running, you only talk to it.
Check yourself:  wg check      stuck?  wg hint
