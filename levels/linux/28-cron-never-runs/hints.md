## 1
Files in `/etc/cron.d/` have one field more than a user crontab: `min hour dom mon dow USER command`. Count the fields in `/etc/cron.d/backup`.
## 2
After adding `root`, still nothing after a minute? cron runs the command via `sh -c` — what does `/opt/backup/run.sh` (without `bash`) say when you run it? Also: `cron -f -L 15 &` shows what cron does, and no syslog here.
## 3
`* * * * * root /opt/backup/run.sh` in `/etc/cron.d/backup`, and `chmod +x /opt/backup/run.sh`. Wait up to a minute.
