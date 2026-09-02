source ../../../lib/common.sh; source ../lib.sh
left=$(R KEYS 'tmp:*')
[ -z "$left" ] || fail "still present: $(echo "$left" | tr '\n' ' ')"
[ "$(R GET app:name)" = shop ] || fail "app:name was deleted — only tmp:* keys should go"
ok "no tmp:* keys left, everything else intact"
