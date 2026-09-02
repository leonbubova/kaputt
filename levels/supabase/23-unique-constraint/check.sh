source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
[ "$(sql "select count(*) from public.waitlist where email in ('ana@example.com','ben@example.com','cleo@example.com')")" = 3 ] || fail "existing subscribers went missing"
[ "$(sql "select count(*) from pg_indexes where schemaname='public' and tablename='waitlist' and indexdef like 'CREATE UNIQUE INDEX%' and indexdef ilike '%email%'")" -ge 1 ] || fail "no unique constraint/index on waitlist.email"
before=$(sql "select count(*) from public.waitlist")
rest_anon POST "/rest/v1/waitlist" -H "Content-Type: application/json" -d '{"email":"ana@example.com"}' >/dev/null 2>&1 || true
[ "$(rest_code)" = 409 ] || fail "repeat signup → $(rest_code) (want 409)"
[ "$(sql "select count(*) from public.waitlist")" = "$before" ] || fail "duplicate row was stored"
ok "waitlist emails are unique, repeat → 409"
