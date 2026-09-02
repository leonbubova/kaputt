## 1
A running nginx only listens on ports some `server` block asks for — no block, no listener, however healthy the process is. `pgrep nginx` shows it running, but `ss -ltn` has nothing on :8080.
## 2
Add a file in /etc/nginx/sites-enabled/ with a `server { listen 8080; ... }` block.
## 3
Create the block returning "api ok\n" on `location /`, then `nginx -s reload`.
