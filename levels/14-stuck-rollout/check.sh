source ../../lib/common.sh
wait_available web 3 60 || fail "web < 3 available"
[ "$($K get deploy web -o jsonpath='{.status.unavailableReplicas}')" = "" ] || fail "unavailable replicas remain"
$K get pods -l app=web --no-headers | grep -vq Running && fail "broken pods still around" || true
ok "rollout healthy 3/3"
