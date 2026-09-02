source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
sb_env
email="wg-$RANDOM$RANDOM@example.com"; pw="Wargame-$RANDOM!"
try_signup() { body=$(rest_anon POST "/auth/v1/signup" -H "Content-Type: application/json" -d "{\"email\":\"$email\",\"password\":\"$pw\"}") && [ "$(rest_code)" = 200 ]; }
retry 30 try_signup || fail "signup → ${REST_CODE:-?}: ${body:-} (auth service down?)"
body=$(rest_anon POST "/auth/v1/token?grant_type=password" -H "Content-Type: application/json" -d "{\"email\":\"$email\",\"password\":\"$pw\"}")
[ "$(rest_code)" = 200 ] && printf '%s' "$body" | grep -q '"access_token"' || fail "sign-in after signup → $(rest_code): $body"
ok "new users can sign in right after signup"
