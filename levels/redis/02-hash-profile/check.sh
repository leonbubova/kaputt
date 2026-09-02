source ../../../lib/common.sh; source ../lib.sh
[ "$(Rt user:1)" = hash ] || fail "user:1 is not a hash"
[ "$(R HGET user:1 name)" = anna ] || fail "user:1 name is not anna"
[ "$(R HGET user:1 age)" = 30 ] || fail "user:1 age is not 30"
ok "user:1 hash populated"
