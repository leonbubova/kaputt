source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/systemd/lib.sh"
XS 'rm -rf /opt/wg/exporter; mkdir -p /opt/wg/exporter/app; printf "10.0.0.1\n10.0.0.2\n10.0.0.3\n" > /opt/wg/exporter/app/targets.txt'
script /opt/wg/exporter/app/exporter.sh <<'X'
#!/bin/bash
# reads ./targets.txt relative to the working directory
[ -f ./targets.txt ] || { echo "targets.txt not found in $PWD"; exit 2; }
echo "targets=$(wc -l < ./targets.txt | tr -d ' ')" > ./status
exec sleep infinity
X
rec exporter "$(sha /opt/wg/exporter/app/exporter.sh)"
unit_file wg-exporter.service <<'U'
[Unit]
Description=wg exporter

[Service]
Type=simple
ExecStart=/opt/wg/exporter/app/exporter.sh
U
SC start wg-exporter.service >/dev/null 2>&1 || true
