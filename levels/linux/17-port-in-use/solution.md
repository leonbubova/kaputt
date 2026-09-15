A stray `python3 -m http.server` from `/var/tmp/.x` holds 8080.
    pkill -f /var/tmp/.x; nohup /opt/web/start.sh >/dev/null 2>&1 &
