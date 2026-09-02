source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/systemd/lib.sh"
XS 'rm -rf /opt/wg/metrics; mkdir -p /opt/wg/metrics/app; printf "interval=15\n" > /opt/wg/metrics/app/config.ini'
script /opt/wg/metrics/app/agent.sh <<'X'
#!/bin/bash
# reads ./config.ini relative to the working directory
[ -f ./config.ini ] || { echo "config.ini not found in $PWD"; exit 2; }
interval=$(sed -n 's/^interval=//p' ./config.ini)
echo "interval=$interval" > ./status
exec sleep infinity
X
rec agent "$(sha /opt/wg/metrics/app/agent.sh)"
unit_file wg-metrics.service <<'U'
[Unit]
Description=wg metrics agent

[Service]
Type=simple
WorkingDirectory=/opt/wg/metrics/ap
ExecStart=/opt/wg/metrics/app/agent.sh
U
SC start wg-metrics.service >/dev/null 2>&1 || true
