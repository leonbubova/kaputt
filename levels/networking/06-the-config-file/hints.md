## 1
The port is the number in the `listen …;` line of `/etc/nginx/sites-enabled/api.conf`. Change the number, keep the `;`.
## 2
After saving, the running server still uses the old file: `nginx -s reload` makes it re-read. Then curl port 8081.
## 3
    nano /etc/nginx/sites-enabled/api.conf      # listen 8081;  — Ctrl+O Enter, Ctrl+X
    nginx -s reload
    curl -s http://localhost:8081/
