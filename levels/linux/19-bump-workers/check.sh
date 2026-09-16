source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
X grep -qx 'workers=4' /etc/app/app.conf 2>/dev/null || fail "workers is not 4"
XS "printf '# managed by cfg-push 2026-08-14 — do not hand-edit\nport=9000\nworkers=4\nlog_level=info\n' | cmp -s - /etc/app/app.conf" 2>/dev/null || fail "other lines changed (or a line is missing)"
ok "workers bumped, rest untouched"
