## 1
Services don't inherit your shell's environment — systemd starts them with an almost empty one, so anything the script needs has to come from the unit. `journalctl -u wg-api -n 5` shows the script bailing because a variable is unset.
## 2
`[Service]` `EnvironmentFile=/etc/wg/api.env` loads `KEY=value` lines into the service's environment. (`Environment=KEY=value` would hardcode them — not wanted here.)
## 3
Add `EnvironmentFile=/etc/wg/api.env` under `[Service]`, then `systemctl daemon-reload && systemctl restart wg-api && cat /opt/wg/api/state`.
