# heartbeat script only runs while someone keeps a terminal open
"`/opt/wg/heartbeat/heartbeat.sh` appends a timestamp to `/opt/wg/heartbeat/log` every 2 s. Right now Tom runs it in a tmux. Make systemd run it as `wg-heartbeat.service`."
Goal: `wg-heartbeat.service` is active, its main process is the script, and the log keeps getting fresh entries.
