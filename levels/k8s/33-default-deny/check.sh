source ../../../lib/common.sh
wait_available backend 1 60 || fail "backend not available"
$K get networkpolicy default-deny-ingress >/dev/null 2>&1 || fail "no networkpolicy default-deny-ingress"
[ "$($K get networkpolicy default-deny-ingress -o jsonpath='{.spec.podSelector}')" = '{}' ] || fail "podSelector must be empty ({}) to select every pod"
$K get networkpolicy default-deny-ingress -o jsonpath='{.spec.policyTypes[*]}' | grep -qw Ingress || fail "policyTypes must include Ingress"
[ -z "$($K get networkpolicy default-deny-ingress -o jsonpath='{.spec.ingress}')" ] || fail "the policy still has ingress rules — allow nothing"
if in_cluster_get http://backend.wg.svc/ | grep -q "Welcome to nginx"; then fail "backend still answers other pods in wg"; fi
ok "wg is closed: backend unreachable, deployment healthy"
