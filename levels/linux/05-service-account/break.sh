source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
userdel -r runner 2>/dev/null; groupdel svc 2>/dev/null
mkdir -p /srv/data; chown root:root /srv/data
IN
