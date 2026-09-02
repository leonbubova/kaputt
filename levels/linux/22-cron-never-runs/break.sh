source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
mkdir -p /opt/backup
cat > /opt/backup/run.sh <<'S'
#!/bin/bash
# minute backup heartbeat
mkdir -p /var/backups/app && date +%s > /var/backups/app/last-run
S
chmod 644 /opt/backup/run.sh
printf '# app backup heartbeat\n* * * * * /opt/backup/run.sh\n' > /etc/cron.d/backup
chmod 644 /etc/cron.d/backup
rm -rf /var/backups/app
IN
X cron >/dev/null 2>&1 || true
