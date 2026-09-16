source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/systemd/lib.sh"
XS 'rm -rf /opt/wg/heartbeat; mkdir -p /opt/wg/heartbeat'
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
U
SC start wg-heartbeat.service
