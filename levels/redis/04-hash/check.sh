source ../../../lib/common.sh; source ../lib.sh
[ "$(R EXISTS pet:1)" = 1 ] || fail "no key pet:1 yet — HSET pet:1 name rex kind dog"
[ "$(Rt pet:1)" = hash ] || fail "pet:1 is a $(Rt pet:1), not a hash — DEL pet:1, then create it with HSET"
[ "$(R HGET pet:1 name)" = rex ] || fail "field name is '$(R HGET pet:1 name)' — wanted rex"
[ "$(R HGET pet:1 kind)" = dog ] || fail "field kind is '$(R HGET pet:1 kind)' — wanted dog"
ok "pet:1 is a hash with name=rex and kind=dog"
