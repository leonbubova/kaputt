source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
try() { body=$(rest_anon POST "/rest/v1/rpc/greet" -H "Content-Type: application/json" -d '{"name":"wg"}') && [ "$(rest_code)" = 200 ]; }
retry 15 try || fail "POST /rest/v1/rpc/greet → $(rest_code): ${body:-}"
[ "$body" = '"hello, wg"' ] || fail "rpc/greet returned $body (want \"hello, wg\")"
ok "rpc/greet answers"
