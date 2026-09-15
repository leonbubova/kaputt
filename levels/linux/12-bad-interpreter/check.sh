source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
want=$(X grep -c ':/home/' /etc/passwd)
X grep -q 'nightly user report' /usr/local/bin/report 2>/dev/null || fail "script was replaced"
got=$(X report 2>/dev/null); [ "$got" = "report: $want users" ] || fail "report prints '$got' (want 'report: $want users')"
ok "report works"
