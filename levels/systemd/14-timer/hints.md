## 1
systemd schedules with a `.timer` unit that has the same name as the service it triggers. `systemctl list-timers --all` shows what exists.
## 2
`/etc/systemd/system/wg-cleanup.timer`: `[Timer]` with `OnCalendar=` (cron-like, check with `systemd-analyze calendar '*:*:00'`) and an `[Install]` `WantedBy=timers.target`. You enable/start the *timer*, not the service.
## 3
```
[Unit]
Description=run wg-cleanup every minute
[Timer]
OnCalendar=*:*:00
[Install]
WantedBy=timers.target
```
`systemctl daemon-reload && systemctl enable --now wg-cleanup.timer`; `systemctl list-timers wg-cleanup.timer` shows NEXT/LAST.
