source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
[ -s "$QUERY" ] || fail "no query in $QUERY"
got=$(sqlq 2>&1) || fail "query.sql fails:
$got"
want=$(printf 'Anna|3\nCara|2\nBen|1')
[ "$got" = "$want" ] || fail "wrong result. want:
$want
got:
$got"
ok "order counts per customer"
