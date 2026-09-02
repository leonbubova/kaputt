## 1
Static files come from the directory in the `root` directive of the shop.local server. Inside the container that is /usr/share/nginx/html — a bind mount of ~/.k8s-wargame/nginx/app/html on your machine (`ls` it: index.html, app.js, style.css).
## 2
Any file dropped into that directory is served under the same name, no reload needed. /robots.txt renders the app today only because try_files finds no such file and falls back to index.html.
## 3
`printf 'User-agent: *\nDisallow: /api/\n' > ~/.k8s-wargame/nginx/app/html/robots.txt` then `curl -H 'Host: shop.local' http://127.0.0.1:8082/robots.txt`.
