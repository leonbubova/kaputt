source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
X grep -qx 'port=9000' /etc/app/app.conf 2>/dev/null || fail "/etc/app/app.conf is not the new config"
X grep -qx 'port=8000' /etc/app/app.conf.bak 2>/dev/null || fail "/etc/app/app.conf.bak does not hold the old config"
ok "config swapped, backup kept"
