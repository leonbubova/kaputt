# Type=simple: systemd owns a long-running process and watches it
Lesson: a oneshot runs and exits. A service is the opposite: a process that should keep running. `Type=simple` (the default) means systemd starts `ExecStart=`, keeps the process as the unit's main PID, and calls the unit `active` for exactly as long as that process lives. When it exits, the unit is no longer active.
This is what a terminal or tmux cannot give you: the process belongs to systemd, not to a login session. Close the terminal, log out — it keeps running. Its stdout and stderr land in the journal instead of a screen nobody is watching.
Nothing else changes: `ExecStart=` is still an absolute path, the file still needs to be executable, and you still `daemon-reload` after writing the unit.
    Type=simple                            long-running process; active while it lives
    systemctl status wg-x                  Main PID, active (running), last log lines
    journalctl -u wg-x -n 20               what the process printed
    systemctl show wg-x -p MainPID         the PID systemd is watching, no guessing
Try it first: `systemctl status wg-marker` from the last level — a finished oneshot shows `inactive (dead)`. A simple service will say `active (running)` instead.
Your task: "`/opt/wg/heartbeat/heartbeat.sh` appends a timestamp to `/opt/wg/heartbeat/log` every 2 s. Right now Tom runs it in a tmux. Make systemd run it as `wg-heartbeat.service`."
Goal: `wg-heartbeat.service` is active, its main process is the script, and the log keeps getting fresh entries.
Check yourself:  wg check      stuck?  wg hint
