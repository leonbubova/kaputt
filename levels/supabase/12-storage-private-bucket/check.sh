source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
sb_env
body=$(curl -s -m 10 -w '\n%{http_code}' "$API_URL/storage/v1/object/public/avatars/team/mo.txt") || fail "storage unreachable"
code=${body##*$'\n'}; body=${body%$'\n'*}
[ "$code" = 200 ] || fail "public avatar URL → $code: $body"
[ "$body" = "avatar-of-mo" ] || fail "unexpected content: $body"
ok "avatars served publicly"
