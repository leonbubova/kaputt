source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/bash/bashlib.sh"
have notready.sh || fail "no notready.sh in the sandbox"
out=$(run notready.sh); c=$(run_code)
[ "$out" = "not ready" ] || fail "notready.sh printed '$out', want 'not ready'"
[ "$c" = 3 ] || fail "notready.sh exited $c, want 3"
ok "notready.sh exits 3"
