source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/systemd/lib.sh"
XS 'rm -rf /opt/wg/report; mkdir -p /opt/wg/report/bin /opt/wg/report/out'
script /opt/wg/report/bin/report.sh <<'X'
#!/bin/bash
# writes a report every 3 seconds
while true; do date "+%F %T report ok" > /opt/wg/report/out/report.txt; sleep 3; done
X
rec report "$(sha /opt/wg/report/bin/report.sh)"
unit_file wg-report.service <<'U'
[Unit]
Description=wg report generator

[Service]
Type=simple
ExecStart=/opt/wg/report/report.sh

[Install]
WantedBy=multi-user.target
U
SC start wg-report.service >/dev/null 2>&1 || true
