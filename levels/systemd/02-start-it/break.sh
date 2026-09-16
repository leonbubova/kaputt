source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/systemd/lib.sh"
XS 'rm -rf /opt/wg/clock; mkdir -p /opt/wg/clock; echo "Thu Jan  1 00:00:00 UTC 1970" > /opt/wg/clock/now'
script /opt/wg/clock/clock.sh <<'X'
#!/bin/bash
# wg-clock: writes the current time every 2 seconds
while true; do date > /opt/wg/clock/now; sleep 2; done
X
unit_file wg-clock.service <<'U'
[Unit]
Description=wg clock

[Service]
Type=simple
ExecStart=/opt/wg/clock/clock.sh
U
