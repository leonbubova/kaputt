source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/systemd/lib.sh"
XS 'rm -rf /opt/wg/clock; mkdir -p /opt/wg/clock'
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
SC start wg-clock.service >/dev/null 2>&1
