source ../../../lib/common.sh; source ../lib.sh
[ "$(Rt thing:a)" = string ] && [ "$(Rt thing:b)" = hash ] && [ "$(Rt thing:c)" = list ] || fail "a thing:* key was changed or deleted — wg reset to start over"
[ "$(R EXISTS answer:list)" = 1 ] || fail "no key answer:list yet — SET answer:list <name of the key that is a list>"
[ "$(R GET answer:list)" = thing:c ] || fail "answer:list is '$(R GET answer:list)' — that key is a $(Rt "$(R GET answer:list)"), not a list. Ask TYPE for each thing:* key"
ok "answer:list = thing:c — TYPE told you, no guessing"
