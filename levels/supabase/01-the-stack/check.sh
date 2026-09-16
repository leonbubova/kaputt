source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
f="$SB_DIR/api-url.txt"; [ -f "$f" ] || fail "no file ~/.k8s-wargame/supabase/api-url.txt yet — source the env file, then echo \$API_URL into it"
got=$(tr -d ' \t\r\n' < "$f")
[ -n "$got" ] || fail "api-url.txt is empty — did you run 'source ~/.k8s-wargame/supabase/env' first? (an unset \$API_URL echoes nothing)"
sb_env
[ "$got" = "$API_URL" ] || fail "api-url.txt contains '$got' — wanted $API_URL (the API_URL line of the env file)"
ok "api-url.txt holds $API_URL — you found the API and the keys file"
