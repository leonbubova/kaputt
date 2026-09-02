## 1
A port only answers if some process has it open — a config file on disk does nothing until a server reads it and starts listening. `ss -ltn` shows nothing on :8080. The config exists in /etc/nginx/sites-enabled/api.conf.
## 2
nginx is installed but not running. Check `pgrep nginx`.
## 3
Start it: `nginx` (then `curl localhost:8080`).
