source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
[ "$(sql "select count(*) from pg_views where schemaname='public' and viewname='leaderboard'")" = 1 ] || fail "no view public.leaderboard"
try() { body=$(rest_anon GET "/rest/v1/leaderboard?select=name,score") && [ "$(rest_code)" = 200 ] && [ "$(json_len "$body")" = 3 ]; }
retry 15 try || fail "GET /rest/v1/leaderboard → $(rest_code): ${body:-} (want 200 with 3 rows)"
printf '%s' "$body" | grep -q cheater && fail "banned player is on the leaderboard"
[ "$(printf '%s' "$body" | tr -d ' \n')" = '[{"name":"kim","score":910},{"name":"ali","score":610},{"name":"mo","score":420}]' ] || fail "wrong rows or order: $body"
ok "leaderboard served by the API"
