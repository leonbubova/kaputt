source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
[ "$(sql "select count(*) from pg_views where schemaname='public' and viewname='customer_totals'")" = 1 ] || fail "no view customer_totals"
got=$(sql "select name, revenue from customer_totals order by revenue desc" 2>&1) || fail "view lacks name/revenue columns:
$got"
want=$(printf 'Anna|150.00\nCara|75.50\nBen|20.00')
[ "$got" = "$want" ] || fail "wrong content. want:
$want
got:
$got"
ok "customer_totals view is live"
