source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
[ "$(sql "select count(*) from accounts")" = 3 ] || fail "accounts table damaged (want 3 rows)"
[ "$(sql "select sum(balance) from accounts")" = 5450.00 ] || fail "balances changed"
out=$(sql "set statement_timeout = '4s'; update accounts set balance = balance where id = 1" 2>&1) || fail "update on account 1 still blocks:
$out"
ok "payments flow again"
