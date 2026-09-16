source ../../../lib/common.sh
$K get deploy web >/dev/null 2>&1 || fail "deployment web is gone — wg reset brings it back"
want=$($K get deploy web -o jsonpath='{.spec.replicas}'); [ "$want" = 3 ] || fail "web wants $want copies, the task asks for 3 — kubectl scale deployment web --replicas=3"
wait_available web 3 60 || fail "web is set to 3 but not all 3 are running yet — kubectl get deployments again in a moment"
ok "web keeps 3 copies running"
