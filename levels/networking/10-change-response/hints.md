## 1
What a port replies is decided by the server's config file: the `return 200 "..."` inside `location /` in /etc/nginx/sites-enabled/api.conf is the text clients get. `curl localhost:8080` shows the current one.
## 2
A running nginx keeps the config it read at start — editing the file changes nothing until you tell it to re-read.
## 3
Change the text to `"api ok\n"`, then `nginx -s reload` (and `curl localhost:8080` again).
