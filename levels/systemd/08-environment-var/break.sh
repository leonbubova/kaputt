source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/systemd/lib.sh"
XS 'rm -rf /opt/wg/banner; mkdir -p /opt/wg/banner'
script /opt/wg/banner/banner.sh <<'X'
#!/bin/bash
: "${SITE_NAME:?SITE_NAME not set}"
echo "site=$SITE_NAME" > /opt/wg/banner/state
echo "banner up for $SITE_NAME"
exec sleep infinity
X
rec banner "$(sha /opt/wg/banner/banner.sh)"
unit_file wg-banner.service <<'U'
[Unit]
Description=wg site banner

[Service]
Type=simple
ExecStart=/opt/wg/banner/banner.sh
U
SC start wg-banner.service >/dev/null 2>&1 || true
