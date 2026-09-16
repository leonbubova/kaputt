source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
try() { body=$(rest_anon POST "/rest/v1/rpc/event_count" -H "Content-Type: application/json" -d '{}') && [ "$(rest_code)" = 200 ]; }
retry 15 try || fail "rpc/event_count → ${REST_CODE:-?}: ${body:-}"
[ "$body" = 5 ] || fail "rpc/event_count returns $body (want 5)"
raw=$(rest_anon GET "/rest/v1/events?select=id"); [ "$(rest_code)" = 200 ] && [ "$(json_len "$raw")" -gt 0 ] && fail "anon can read raw events — the table must stay private"
ok "counter shows 5, raw events stay private"
