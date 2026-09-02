## 1
`systemctl status wg-api` after a crash says `failed` and nothing else happens: the default is `Restart=no`. `systemctl show wg-api -p Restart -p RestartUSec` shows the current policy.
## 2
`[Service]` `Restart=on-failure` restarts on non-zero exit and on signals; `Restart=always` also after a clean exit. `RestartSec=` is the delay (default 100 ms).
## 3
`systemctl edit --full wg-api` (or edit the file), add under `[Service]`: `Restart=on-failure` and `RestartSec=2`. Then `systemctl daemon-reload && systemctl restart wg-api`. Test: `kill -9 $(systemctl show wg-api -p MainPID --value)`; `systemctl status wg-api` shows a new PID.
