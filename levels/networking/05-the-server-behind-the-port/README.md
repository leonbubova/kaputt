# the server behind the port — nginx
Lesson: a port only answers while a program holds it open. In this box that program is nginx, a web server.
Stop it and the port goes dead; start it and the port is back. Three commands:
    pgrep nginx        print the process numbers of nginx — no output means it is not running
    nginx -s stop      stop it
    nginx              start it (silence = it started)
Try it — inside the box, one after the other, and watch curl change its mind:
    pgrep nginx
    curl -s http://localhost:8080/
    nginx -s stop
    curl -s http://localhost:8080/
Now curl says `Connection refused`, and `ss -ltnp` no longer lists 8080: nobody is home.
Your task: start nginx again so `curl -s http://localhost:8080/` answers `api ok`. The check wants a fresh
start — nginx must have been stopped and started, not just left running from before.
Work inside the box (`wg shell`).
Check yourself:  wg check      stuck?  wg hint
