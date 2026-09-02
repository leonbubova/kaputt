source ../../../lib/common.sh; source ../lib.sh
[ "$(Rt events)" = list ] || fail "events is not a list (type: $(Rt events))"
got=$(R LRANGE events 0 -1 | tr '\n' ',')
[ "$got" = "signup,login," ] || fail "events is [$got], want signup,login"
ok "events is a list again"
