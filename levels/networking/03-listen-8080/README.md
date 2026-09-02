# nginx listens only where a server block tells it to
Lesson: a running nginx process is not the same as a listening port. nginx opens a port only because some `server { listen PORT; }` block in its config asks for it. Remove the block and the process stays perfectly healthy while the port goes silent — `pgrep` says yes, `ss -ltn` says nothing.
Each site is its own block, kept in a file under /etc/nginx/sites-enabled/. A minimal API vhost needs three things: which port to listen on, a `location /` for requests, and what to answer — `return 200 "text\n";` answers without any files on disk.
Config changes are read only when you ask. `nginx -t` checks the syntax and names the file and line if it is wrong; `nginx -s reload` makes the running process re-read everything without dropping connections.
    ss -ltn                       is anything listening on :8080?
    ls /etc/nginx/sites-enabled/  the site files nginx loads
    nginx -t                      syntax check before reloading
    nginx -s reload               re-read the config
Try it first: `pgrep nginx; ss -ltn` — a running process with no port is exactly this level.
Your task: the web server is up, but there is no server block for the API. Create an nginx site that listens on 8080 and returns "api ok", then reload.
Check yourself:  wg check      stuck?  wg hint
