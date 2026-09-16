# the server reads a config file
Lesson: which port nginx listens on, and what it answers, is not built in — it reads it from a text file at start.
The file for our API is `/etc/nginx/sites-enabled/api.conf`. Look at it:
    cat /etc/nginx/sites-enabled/api.conf
`listen 8080;` is the port. `return 200 "api ok\n";` is the answer. Every line ends with `;`.
Editing the file changes nothing by itself — the running nginx still has the old text in memory. Tell it to re-read:
    nginx -s reload
Try it — inside the box: open the file in the editor (`nano /etc/nginx/sites-enabled/api.conf`, Ctrl+O Enter saves,
Ctrl+X leaves), change nothing yet, leave, then run `nginx -s reload` and `curl -s http://localhost:8080/` — still `api ok`.
Your task: move the API to port 8081. Change `listen 8080;` to `listen 8081;` in that file, reload nginx, and confirm
that `curl -s http://localhost:8081/` prints `api ok`.
Work inside the box (`wg shell`).
Check yourself:  wg check      stuck?  wg hint
