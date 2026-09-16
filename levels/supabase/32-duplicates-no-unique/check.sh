source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
[ "$(sql "select count(distinct email) from public.subscribers")" = 5 ] || fail "distinct subscribers changed (want 5) — dedupe, don't wipe"
[ "$(sql "select count(*) - count(distinct email) from public.subscribers")" = 0 ] || fail "duplicates still present"
[ "$(sql "select count(*) from pg_indexes where schemaname='public' and tablename='subscribers' and indexdef like 'CREATE UNIQUE INDEX%' and indexdef ilike '%email%'")" -ge 1 ] || fail "no unique constraint/index on email"
rest_anon POST "/rest/v1/subscribers" -H "Content-Type: application/json" -d '{"email":"ana@example.com"}' >/dev/null 2>&1 || true
[ "$(rest_code)" = 409 ] || fail "duplicate signup should be rejected (got $(rest_code))"
ok "subscribers unique, dupes gone"
