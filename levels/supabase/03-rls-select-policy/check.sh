source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
rls_on notes || fail "RLS on notes is off — it must stay enabled"
body=$(rest_anon GET "/rest/v1/notes?select=id,body") || fail "API unreachable"
[ "$(rest_code)" = 200 ] || fail "GET /rest/v1/notes → $(rest_code): $body"
[ "$(json_len "$body")" -ge 3 ] || fail "anon GET /rest/v1/notes returns $(json_len "$body") rows (want 3)"
rest_anon POST "/rest/v1/notes" -H "Content-Type: application/json" -d '{"body":"x"}' >/dev/null 2>&1 || true
[ "$(rest_code)" != 201 ] || fail "anon can INSERT notes — read-only was the ask"
ok "anon reads notes, cannot write, RLS on"
