source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
try() { body=$(rest_anon POST "/rest/v1/rpc/order_count" -H "Content-Type: application/json" -d '{}') && [ "$(rest_code)" = 200 ]; }
retry 15 try || fail "POST /rest/v1/rpc/order_count → $(rest_code): ${body:-}"
[ "$body" = 4 ] || fail "rpc/order_count returns $body (want 4)"
raw=$(rest_anon GET "/rest/v1/orders?select=id"); [ "$(rest_code)" = 200 ] && [ "$(json_len "$raw")" -gt 0 ] && fail "anon can read raw orders — the table must stay private"
[ "$(sql "select count(*) from pg_policies where tablename='orders'")" = 0 ] || fail "no policies on orders — the count must come from the function"
ok "order_count answers 4, orders stay private"
