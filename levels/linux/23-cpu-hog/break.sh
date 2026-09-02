source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
mkdir -p /usr/local/lib/.cache && cp /bin/bash /usr/local/lib/.cache/kworkerd
IN
XD /usr/local/lib/.cache/kworkerd -c 'while :; do :; done'
sleep 2
