# a port only answers when a process is listening on it
Lesson: a config file on disk does nothing by itself. A port comes alive only when a running process opens it — the kernel then hands every incoming connection on that port to that process. No process, no listener, and a client gets "connection refused" straight away.
So the first question for "the service doesn't answer" is never "is the config right?" but "is anything listening at all?". `ss -ltn` lists every listening TCP socket on the box; if the port is not in that list, no amount of config editing will help until the server is started.
For nginx: the site config lives in /etc/nginx/sites-enabled/, but nginx only reads it when it starts. Starting it is a single command; it forks into the background on its own.
    ss -ltnp                      listening TCP ports, with the owning process
    pgrep nginx                   is an nginx process running? (no output = no)
    nginx                         start the web server
    curl -s localhost:8080        ask the API; refused = nobody listening
Try it first: `ss -ltn` right now — note which ports are open, then `curl -s localhost:8080`.
Your task: the site config for the internal API is in place, but the web server was never started. Bring nginx up so http://localhost:8080/ returns "api ok".
Check yourself:  wg check      stuck?  wg hint
