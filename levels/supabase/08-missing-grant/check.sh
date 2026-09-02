source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
rls_on products || fail "RLS on products is off"
body=$(rest_anon GET "/rest/v1/products?select=id,name") || fail "API unreachable"
[ "$(rest_code)" = 200 ] || fail "GET /rest/v1/products → $(rest_code): $body"
[ "$(json_len "$body")" -ge 3 ] || fail "returns $(json_len "$body") rows (want 3)"
rest_anon POST "/rest/v1/products" -H "Content-Type: application/json" -d '{"name":"x","price_cents":1}' >/dev/null 2>&1 || true
[ "$(rest_code)" != 201 ] || fail "anon can INSERT products — grant only what is needed"
ok "catalog readable, still read-only for anon"
