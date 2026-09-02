source ../../../lib/common.sh; source ../lib.sh
[ "$(Rt tags)" = set ] || fail "tags is not a set (type: $(Rt tags))"
got=$(R SMEMBERS tags | sort | tr '\n' ',')
[ "$got" = "blue,green,red," ] || fail "tags members are [$got], want blue,green,red"
ok "tags is a unique set"
