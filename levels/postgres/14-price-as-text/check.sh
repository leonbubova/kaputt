source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
has_table products || fail "products table is gone — change the column, don't rebuild"
t=$(col_type products price); [ "$t" = numeric ] || fail "products.price should be numeric, is '$t'"
[ "$(sql "select count(*) from products")" = 4 ] || fail "rows went missing (want 4)"
got=$(sql "select name || '=' || price from products order by name"); want=$(printf 'Cable=5.00\nKeyboard=49.90\nMonitor=199.00\nMouse=19.90')
[ "$got" = "$want" ] || fail "prices changed. want:
$want
got:
$got"
[ "$(sql "select sum(price) from products")" = 273.80 ] || fail "sum(price) is off"
ok "price is numeric, values kept"
