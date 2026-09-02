## 1
`curl localhost:8080` works but `curl $(hostname -I | awk '{print $1}'):8080` is refused. `ss -ltn` shows 127.0.0.1:8080.
## 2
The listen directive is `listen 127.0.0.1:8080;` — loopback only. Change it to all interfaces.
## 3
Set `listen 8080;`. Changing the bind address needs a full restart, not just reload: `nginx -s stop; nginx`.
