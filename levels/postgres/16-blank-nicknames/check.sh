source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
[ "$(sql "select count(*) from customers")" = 4 ] && [ "$(sql "select count(*) from customers where nickname is null")" = 2 ] || fail "customers data changed — fix the query, not the rows"
[ -s "$QUERY" ] || fail "no query in $QUERY"
got=$(sqlq 2>&1) || fail "query.sql fails:
$got"
want=$(printf '1|Annie\n2|Ben\n3|CC\n4|Dan')
[ "$got" = "$want" ] || fail "wrong result. want:
$want
got:
$got"
ok "every customer gets a name"
