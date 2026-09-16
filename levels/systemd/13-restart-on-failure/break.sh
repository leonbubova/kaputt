source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/systemd/lib.sh"
XS 'rm -rf /opt/wg/api; mkdir -p /opt/wg/api'
script /opt/wg/api/api.sh <<'X'
#!/bin/bash
# fake api: stays up until killed
echo "api up, pid 44922"
exec sleep infinity
X
rec api "$(sha /opt/wg/api/api.sh)"
unit_file wg-api.service <<'U'
[Unit]
Description=wg api

[Service]
Type=simple
ExecStart=/opt/wg/api/api.sh

[Install]
WantedBy=multi-user.target
U
SC enable --now wg-api.service >/dev/null 2>&1
