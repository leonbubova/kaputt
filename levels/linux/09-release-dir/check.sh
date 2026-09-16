source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
[ "$(X cat /srv/app/releases/1.4.2/VERSION 2>/dev/null | tr -d '[:space:]')" = 1.4.2 ] || fail "VERSION missing or wrong content"
X test -d /srv/app/releases/1.4.2/conf 2>/dev/null || fail "conf/ directory missing"
ok "release dir ready"
