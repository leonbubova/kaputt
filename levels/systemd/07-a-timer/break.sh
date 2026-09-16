source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/systemd/lib.sh"
XS 'rm -rf /opt/wg/tick; mkdir -p /opt/wg/tick; rm -f /etc/systemd/system/wg-tick.timer'
unit_file wg-tick.service <<'U'
[Unit]
Description=wg tick

[Service]
Type=oneshot
ExecStart=/bin/sh -c 'date > /opt/wg/tick/last'
U
