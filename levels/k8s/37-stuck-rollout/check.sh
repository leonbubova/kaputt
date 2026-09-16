source ../../../lib/common.sh
wait_available web 3 60 || fail "web < 3 available"
[ "$($K get deploy web -o jsonpath='{.status.unavailableReplicas}')" = "" ] || fail "unavailable replicas remain"
for i in $(seq 1 30); do $K get pods -l app=web --no-headers | grep -vq Running || break; sleep 2; done
$K get pods -l app=web --no-headers | grep -vq Running && fail "broken pods still around" || true
ok "rollout healthy 3/3"
