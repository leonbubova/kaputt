source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
[ "$(sql "select count(*) from invoices")" = 5 ] || fail "invoices deleted (want 5)"
[ "$(sql "select count(*) from pg_views where schemaname='public' and viewname='invoice_totals'")" = 1 ] || fail "view invoice_totals is gone"
[ "$(sql "select count(*) from invoice_totals where total is null")" = 0 ] || fail "invoice_totals still has empty totals"
got=$(sql "select id || '=' || total from invoice_totals order by id"); want=$(printf '1=100.00\n2=80.00\n3=200.00\n4=50.00\n5=99.00')
[ "$got" = "$want" ] || fail "totals wrong. want:
$want
got:
$got"
ok "every invoice has a total"
