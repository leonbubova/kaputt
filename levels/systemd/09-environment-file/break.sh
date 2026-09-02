source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/systemd/lib.sh"
XS 'rm -rf /opt/wg/api /etc/wg; mkdir -p /opt/wg/api /etc/wg; printf "API_PORT=9090\nAPI_TOKEN=s3cret-rotate-me\n" > /etc/wg/api.env; chmod 600 /etc/wg/api.env'
script /opt/wg/api/api.sh <<'X'
#!/bin/bash
: "${API_PORT:?API_PORT not set}"
: "${API_TOKEN:?API_TOKEN not set}"
printf 'port=%s\ntoken=%s\n' "$API_PORT" "$API_TOKEN" > /opt/wg/api/state
echo "api listening on $API_PORT"
exec sleep infinity
X
unit_file wg-api.service <<'U'
[Unit]
Description=wg api

[Service]
Type=simple
ExecStart=/opt/wg/api/api.sh
U
SC start wg-api.service >/dev/null 2>&1 || true
