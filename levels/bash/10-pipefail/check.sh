source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/bash/bashlib.sh"
have firstword.sh || fail "no firstword.sh in the sandbox"
out=$(run firstword.sh data.txt); c=$(run_code)
[ "$out" = alpha ] && [ "$c" = 0 ] || fail "firstword.sh data.txt → '$out' (exit $c), want 'alpha' exit 0"
run firstword.sh nope.txt >/dev/null 2>&1; c=$(run_code)
[ "$c" != 0 ] || fail "firstword.sh nope.txt exited 0 — missing file must fail"
ok "firstword propagates the pipeline failure"
