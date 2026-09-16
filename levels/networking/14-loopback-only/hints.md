## 1
A listener has an address as well as a port. `ss -ltn` shows `*:8080` (or `0.0.0.0:8080`) — every address on the box, including the one other hosts use (`hostname -I`).
## 2
The `listen` directive takes `address:port`: `listen 127.0.0.1:8080;` opens the port on loopback only.
## 3
Set `listen 127.0.0.1:8080;`, then restart: `nginx -s stop; nginx`. `ss -ltn` should now show 127.0.0.1:8080.
