source ../../../lib/common.sh; source ../lib.sh
[ "$(Rt queue:jobs)" = list ] || fail "queue:jobs is not a list"
got=$(R LRANGE queue:jobs 0 -1 | tr '\n' ',')
[ "$got" = "build,test,deploy," ] || fail "queue:jobs is [$got], want build,test,deploy"
ok "queue:jobs seeded in order"
