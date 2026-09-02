source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/bash/bashlib.sh"
have countdown.sh || fail "no countdown.sh in the sandbox"
out=$(run countdown.sh 3); want=$(printf '3\n2\n1')
[ "$out" = "$want" ] || fail "countdown.sh 3 →
$out
want 3/2/1"
out=$(run countdown.sh 1); [ "$out" = 1 ] || fail "countdown.sh 1 → '$out', want 1"
ok "countdown reaches 1"
