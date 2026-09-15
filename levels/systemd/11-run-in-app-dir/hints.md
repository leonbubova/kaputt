## 1
A service has no "current directory" of its own — systemd starts it in `/`, so `./targets.txt` means `/targets.txt`. `journalctl -u wg-exporter -n 5` shows where the script looked.
## 2
`[Service]` `WorkingDirectory=/abs/dir` makes systemd `cd` there before running `ExecStart=`.
## 3
Add `WorkingDirectory=/opt/wg/exporter/app` under `[Service]` in `/etc/systemd/system/wg-exporter.service`, then `systemctl daemon-reload && systemctl restart wg-exporter && cat /opt/wg/exporter/app/status`.
