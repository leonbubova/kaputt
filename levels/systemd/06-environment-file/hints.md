## 1
`journalctl -u wg-api -n 5` shows the script bailing because a variable is unset. Services don't inherit your shell's environment — the unit has to provide it.
## 2
`[Service]` `EnvironmentFile=/etc/wg/api.env` loads `KEY=value` lines into the service's environment. (`Environment=KEY=value` would hardcode them — not wanted here.)
## 3
Add `EnvironmentFile=/etc/wg/api.env` under `[Service]`, then `systemctl daemon-reload && systemctl restart wg-api && cat /opt/wg/api/state`.
