source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/bash/bashlib.sh"
have report.sh || fail "no report.sh in the sandbox"
out=$(run report.sh); [ "$out" = "total: 42" ] || fail "report.sh → '$out', want 'total: 42'"
ok "report prints the total"
