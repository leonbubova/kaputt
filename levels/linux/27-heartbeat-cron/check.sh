source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
X pgrep -x cron >/dev/null 2>&1 || fail "cron daemon is not running (start it: cron)"
X grep -q '/opt/monitor/beat.sh' /etc/cron.d/heartbeat 2>/dev/null || fail "no entry for beat.sh in /etc/cron.d/heartbeat"
t=95; [ -n "${WG_FAST:-}" ] && t=8; i=0
while [ $i -lt $t ]; do
  age=$(XS 'f=/var/lib/monitor/heartbeat; [ -f $f ] && echo $(( $(date +%s) - $(stat -c %Y $f) ))' 2>/dev/null)
  [ -n "$age" ] && [ "$age" -lt 120 ] && { ok "cron wrote heartbeat ${age}s ago"; exit 0; }
  sleep 3; i=$((i+3))
done
fail "heartbeat not written by cron (waited ${t}s)"
