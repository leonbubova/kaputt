source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
X grep -q 'password=Pa55w0rd' /etc/app/db.conf 2>/dev/null || fail "db.conf content changed or file gone"
s=$(X stat -c '%U:%G %a' /etc/app/db.conf 2>/dev/null); [ "$s" = "app:app 640" ] || fail "db.conf is '$s' (want 'app:app 640')"
ok "db.conf locked down"
