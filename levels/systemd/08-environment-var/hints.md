## 1
Your shell's variables never reach a service: systemd starts every unit with an almost empty environment, so `export SITE_NAME=…` in the terminal changes nothing for it. `journalctl -u wg-banner -n 5` shows the script bailing.
## 2
Variables for a service are declared in the unit: `[Service]` `Environment=KEY=value` (one or more per line).
## 3
Add `Environment=SITE_NAME=berlin-1` under `[Service]` in `/etc/systemd/system/wg-banner.service`, then `systemctl daemon-reload && systemctl restart wg-banner && cat /opt/wg/banner/state`.
