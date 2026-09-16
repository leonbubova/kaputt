source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
[ "$(md5 -q "$QUERY" 2>/dev/null || md5sum < "$QUERY" | cut -c1-32)" = "$(cat "$WG_PG_DIR/.query.md5")" ] || fail "query.sql was changed — the app team won't ship that"
[ "$(sql "select count(*) from orders")" -ge 200000 ] || fail "rows went missing — don't delete data"
plan=$(sql "explain select id, total, placed_at from orders where customer_id = 777 order by placed_at desc"); printf '%s' "$plan" | grep -qi 'index' || fail "still a full table scan:
$plan"
ok "order history served from an index"
