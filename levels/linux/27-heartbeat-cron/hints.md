## 1
cron runs commands on a schedule read from crontab files. A file in `/etc/cron.d/` has six fields per line: `minute hour day-of-month month day-of-week USER command`; `*` means "every". `cat /etc/crontab` shows the same layout with examples.
## 2
`* * * * * root /opt/monitor/beat.sh` is "every minute, as root". The file must be owned by root, mode 644, no dot in its name — otherwise cron silently skips it. Then wait up to a minute: `ls -l /var/lib/monitor`.
## 3
`echo '* * * * * root /opt/monitor/beat.sh' > /etc/cron.d/heartbeat`, wait a minute, `cat /var/lib/monitor/heartbeat`.
