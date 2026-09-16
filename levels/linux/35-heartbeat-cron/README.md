# add a minute heartbeat via cron
Ticket: "Monitoring wants a heartbeat from this box. Add a system cron entry `/etc/cron.d/heartbeat` that runs `/opt/monitor/beat.sh` every minute as `root`. cron is running and the script works — it writes `/var/lib/monitor/heartbeat`."
Goal: `/var/lib/monitor/heartbeat` is written by cron and fresh (younger than 2 minutes). Keep it a cron job.
