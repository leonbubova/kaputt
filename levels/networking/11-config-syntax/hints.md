## 1
nginx parses its whole config at startup and refuses to run on a single syntax error — but it has a test mode that names the file and line. `nginx -t` reports the error and its line in /etc/nginx/sites-enabled/api.conf.
## 2
The `listen 8080` directive is missing its terminating semicolon.
## 3
Add the `;` after `listen 8080`, then start nginx.
