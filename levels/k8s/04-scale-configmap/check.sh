source ../../../lib/common.sh
[ "$($K get deploy web -o jsonpath='{.spec.replicas}' 2>/dev/null)" = 4 ] || fail "web is not set to 4 replicas"
wait_available web 4 90 || fail "web does not have 4 available replicas"
$K get cm notes >/dev/null 2>&1 || fail "no configmap notes"
v=$($K get cm notes -o jsonpath='{.data.podcount}'); [ "$v" = 4 ] || fail "notes.podcount is '$v', want 4"
ok "web 4/4, notes.podcount=4"
