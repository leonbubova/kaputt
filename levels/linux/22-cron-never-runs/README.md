# backup cron job never runs
"`/etc/cron.d/backup` should run `/opt/backup/run.sh` every minute and update `/var/backups/app/last-run`. cron is running. The file never appears. Running the script by hand works: `bash /opt/backup/run.sh`."
Goal: `/var/backups/app/last-run` is written by cron (fresh within the last 2 minutes). Keep it a cron job.
