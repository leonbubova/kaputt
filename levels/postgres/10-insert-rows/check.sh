source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
has_table products || fail "products table is gone"
n=$(sql "select count(*) from products"); [ "$n" = 3 ] || fail "want 3 rows, got $n"
got=$(sql "select name || '=' || price from products order by name")
[ "$got" = "$(printf 'Keyboard=49.90\nMonitor=199.00\nMouse=19.90')" ] || fail "rows differ:
$got"
ok "catalogue loaded"
