source ../../../lib/common.sh
[ "$(kubectl get node k3d-wargame-agent-1 -o jsonpath='{.spec.unschedulable}')" = true ] || fail "agent-1 is still schedulable (cordon it)"
left=$($K get pods --field-selector spec.nodeName=k3d-wargame-agent-1 --no-headers 2>/dev/null | wc -l | tr -d ' ')
[ "$left" = 0 ] || fail "$left wg pod(s) still on agent-1"
wait_available web 3 60 || fail "web < 3 available"
ok "agent-1 drained, web 3/3"
