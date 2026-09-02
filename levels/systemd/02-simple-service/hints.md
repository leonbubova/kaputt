## 1
A long-running process is `Type=simple` (the default): systemd starts `ExecStart=` and considers the unit active as long as that process lives.
## 2
Unit in `/etc/systemd/system/wg-heartbeat.service`, `ExecStart=/opt/wg/heartbeat/heartbeat.sh` (absolute path, script is executable). Then `daemon-reload`, `start`, `status`.
## 3
```
[Unit]
Description=heartbeat
[Service]
Type=simple
ExecStart=/opt/wg/heartbeat/heartbeat.sh
```
`systemctl daemon-reload && systemctl start wg-heartbeat` — `tail -f /opt/wg/heartbeat/log` should tick.
