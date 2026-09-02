source ../../../lib/common.sh; source ../lib.sh
[ "$(rel_status web)" = deployed ] || fail "release web is not deployed"
helm get values web -n $NS 2>/dev/null | grep -q '^replicas: 2' || fail "helm does not know about replicas=2 (helm get values web) — scale through helm, not kubectl"
[ "$(rel_revs web)" -ge 2 ] || fail "no second revision — use helm upgrade"
wait_available web 2 60 || fail "web does not have 2 available replicas"
ok "web scaled to 2 via helm"
