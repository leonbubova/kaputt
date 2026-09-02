source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
[ "$(sql "select count(*) from sales")" = 5 ] || fail "sales table damaged"
got=$(PGROLE=wg_reporter sql "select count(*) from sales" 2>&1) || fail "wg_reporter still can't read sales:
$got"
[ "$got" = 5 ] || fail "wg_reporter sees $got rows, want 5"
PGROLE=wg_reporter rejects "insert into sales (region, amount, sold_at) values ('x', 1, '2026-01-01')" || fail "wg_reporter can INSERT — read-only means read-only"
PGROLE=wg_reporter rejects "delete from sales where id = 1" || fail "wg_reporter can DELETE — read-only means read-only"
PGROLE=wg_reporter rejects "update sales set amount = 0 where id = 1" || fail "wg_reporter can UPDATE — read-only means read-only"
ok "reporter reads sales, nothing else"
