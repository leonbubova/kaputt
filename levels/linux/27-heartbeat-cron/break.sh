source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
mkdir -p /opt/monitor
cat > /opt/monitor/beat.sh <<'S'
#!/bin/bash
# monitoring heartbeat
mkdir -p /var/lib/monitor && date +%s > /var/lib/monitor/heartbeat
S
chmod 755 /opt/monitor/beat.sh
rm -f /etc/cron.d/heartbeat; rm -rf /var/lib/monitor
IN
X cron >/dev/null 2>&1 || true
