source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/systemd/lib.sh"
key=$(XS 'head -c 6 /dev/urandom | od -An -tx1 | tr -d " \n"')
XS "rm -rf /opt/wg/license; mkdir -p /opt/wg/license; printf '%s\n' '$key' > /run/wg-license.seed; chmod 600 /run/wg-license.seed"
script /opt/wg/license/license.sh <<'X'
#!/bin/bash
# one-time license activation: prints the key it was handed, then discards it
k=$(cat /run/wg-license.seed 2>/dev/null); rm -f /run/wg-license.seed
echo "license check ok"
echo "activation key: $k"
X
unit_file wg-license.service <<'U'
[Unit]
Description=wg license activation

[Service]
Type=oneshot
ExecStart=/opt/wg/license/license.sh
U
SC start wg-license.service >/dev/null 2>&1 || true
rec key "$key"
