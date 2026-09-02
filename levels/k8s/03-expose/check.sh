source ../../../lib/common.sh
$K get svc web >/dev/null 2>&1 || fail "no service web"
[ "$($K get svc web -o jsonpath='{.spec.type}')" = ClusterIP ] || fail "service type is not ClusterIP"
[ "$($K get svc web -o jsonpath='{.spec.ports[0].port}')" = 80 ] || fail "service port is not 80"
wait_available web 2 60 || fail "web pods not available"
in_cluster_get http://web.wg.svc/ | grep -q "Welcome to nginx" || fail "http://web.wg.svc/ does not answer"
ok "web reachable via service"
