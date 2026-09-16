## 1
systemd knows exactly which process it started for a unit — that is its "main PID". `systemctl status wg-heartbeat` shows it in the `Main PID:` line, next to the process list of the unit. `pgrep -f heartbeat.sh` finds two processes; only one belongs to the unit.
## 2
Every property `status` prints is available on its own, script-friendly: `systemctl show wg-heartbeat -p MainPID` — add `--value` to get just the number.
## 3
`systemctl show wg-heartbeat -p MainPID --value > /run/wg-heartbeat.pid` — `cat` it and compare with `systemctl status wg-heartbeat`.
