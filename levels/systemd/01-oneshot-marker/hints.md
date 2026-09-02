## 1
systemd doesn't run commands you type — it runs *units*: text files that say what to start and how. System units live in `/etc/systemd/system/<name>.service`. Minimum: a `[Unit]` with `Description=` and a `[Service]` with `Type=` and `ExecStart=`. After writing a file: `systemctl daemon-reload`.
## 2
`Type=oneshot` is for "run to completion" jobs. `ExecStart=` needs an absolute path to a binary — a shell pipeline goes via `/bin/sh -c '...'`.
## 3
```
[Unit]
Description=provisioning marker
[Service]
Type=oneshot
ExecStart=/bin/sh -c 'hostname > /opt/wg/marker/ran'
```
→ `systemctl daemon-reload && systemctl start wg-marker && systemctl status wg-marker`.
