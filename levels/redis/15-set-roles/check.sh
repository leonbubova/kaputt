source ../../../lib/common.sh; source ../lib.sh
[ "$(Rt roles)" = set ] || fail "roles is not a set (type: $(Rt roles))"
got=$(R SMEMBERS roles | sort | tr '\n' ',')
[ "$got" = "admin,editor,viewer," ] || fail "roles members are [$got], want admin,editor,viewer"
ok "roles is a set with the three members"
