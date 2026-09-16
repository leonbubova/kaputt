## 1
systemd only restarts a dead service if the unit asks for it — the default is `Restart=no`, so a crashed unit just sits in `failed` forever. `systemctl status wg-api` after a crash shows exactly that; `systemctl show wg-api -p Restart -p RestartUSec` shows the current policy.
## 2
`[Service]` `Restart=on-failure` restarts on non-zero exit and on signals; `Restart=always` also after a clean exit. `RestartSec=` is the delay (default 100 ms).
## 3
`systemctl edit --full wg-api` (or edit the file), add under `[Service]`: `Restart=on-failure` and `RestartSec=2`. Then `systemctl daemon-reload && systemctl restart wg-api`. Test: `kill -9 $(systemctl show wg-api -p MainPID --value)`; `systemctl status wg-api` shows a new PID.
