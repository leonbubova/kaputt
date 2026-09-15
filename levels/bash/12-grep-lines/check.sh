source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/bash/bashlib.sh"
have errors.sh || fail "no errors.sh in the sandbox"
have app.log || fail "app.log missing (environment problem)"
out=$(run errors.sh app.log); want=$(printf 'ERROR disk full\nERROR timeout\nERROR disk full')
[ "$out" = "$want" ] || fail "errors.sh app.log →
$out
want the three ERROR lines only"
ok "errors.sh filters the log"
