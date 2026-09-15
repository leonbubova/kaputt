source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
[ "$(md5 -q "$QUERY" 2>/dev/null || md5sum < "$QUERY" | cut -c1-32)" = "$(cat "$WG_PG_DIR/.query.md5")" ] || fail "query.sql was changed — the app is frozen"
[ "$(sql "select count(*) from events")" -ge 100003 ] || fail "rows went missing"
got=$(sqlq 2>&1) || fail "query.sql still fails:
$got"
[ "$got" = 3 ] || fail "query returns $got, want 3"
plan=$(sql "explain select count(*) from events where user_id = 4242"); printf '%s' "$plan" | grep -qi 'index' || fail "query works but scans the whole table:
$plan"
ok "user_id is a number again, lookup uses the index"
