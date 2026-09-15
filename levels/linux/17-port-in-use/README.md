# web service won't start: "Address already in use"
"`/opt/web/start.sh` dies with `OSError: [Errno 98] Address already in use`. Nothing of ours should be on 8080. And whatever answers there serves garbage."
Goal: `curl http://127.0.0.1:8080/` prints `hello from web`, served by `/opt/web/start.sh` (leave the script and port as they are).
