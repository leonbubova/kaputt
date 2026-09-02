source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/systemd/lib.sh"
XS 'rm -rf /opt/wg/cleanup; mkdir -p /opt/wg/cleanup/tmp; touch /opt/wg/cleanup/tmp/old.dat'
unit_file wg-cleanup.service <<'U'
[Unit]
Description=purge wg tmp files

[Service]
Type=oneshot
ExecStart=/bin/sh -c 'find /opt/wg/cleanup/tmp -type f -mmin +10 -delete; date +%s > /opt/wg/cleanup/last-run'
U
