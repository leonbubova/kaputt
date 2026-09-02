source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
has_table events || fail "events table is gone"
[ "$(sql "select count(*) from events")" -ge 100000 ] || fail "rows went missing — don't delete data"
[ "$(sql "select count(*) from pg_indexes where schemaname='public' and tablename='events' and indexdef ilike '%(user_id%'")" -ge 1 ] || fail "no index on events(user_id)"
plan=$(sql "explain select * from events where user_id = 42"); printf '%s' "$plan" | grep -qi 'index' || fail "query still scans the whole table:
$plan"
ok "feed query uses an index"
