source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/systemd/lib.sh"
XS 'pkill -f /opt/wg/heartbeat/heartbeat.sh 2>/dev/null; rm -rf /opt/wg/heartbeat; mkdir -p /opt/wg/heartbeat'
script /opt/wg/heartbeat/heartbeat.sh <<'X'
#!/bin/bash
# heartbeat: one line every 2 seconds
while true; do date +%s >> /opt/wg/heartbeat/log; sleep 2; done
X
