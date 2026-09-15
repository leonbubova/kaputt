source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/systemd/lib.sh"
XS 'pkill -9 -u wg-app 2>/dev/null; rm -rf /opt/wg/heartbeat /run/wg-heartbeat.pid; mkdir -p /opt/wg/heartbeat'
script /opt/wg/heartbeat/heartbeat.sh <<'X'
#!/bin/bash
while true; do date +%s >> /opt/wg/heartbeat/log; sleep 2; done
X
unit_file wg-heartbeat.service <<'U'
[Unit]
Description=heartbeat

[Service]
Type=simple
ExecStart=/opt/wg/heartbeat/heartbeat.sh

[Install]
WantedBy=multi-user.target
U
SC enable --now wg-heartbeat.service >/dev/null 2>&1
# Tom's stray copy: same name in ps, not managed by systemd (runs as wg-app so track_wipe kills it)
XS "runuser -u wg-app -- setsid -f bash -c 'exec -a /opt/wg/heartbeat/heartbeat.sh sleep infinity' >/dev/null 2>&1"
