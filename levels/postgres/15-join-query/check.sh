source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
[ -s "$QUERY" ] || fail "no query in $QUERY"
got=$(sqlq 2>&1) || fail "query.sql fails:
$got"
want=$(printf 'Anna|100.00\nCara|75.50\nAnna|50.00\nBen|20.00')
[ "$got" = "$want" ] || fail "wrong result. want:
$want
got:
$got"
ok "join query returns the order list"
