source ../../../lib/common.sh
$K get svc web >/dev/null 2>&1 || fail "no service web"
[ "$($K get svc web -o jsonpath='{.spec.type}')" = ClusterIP ] || fail "service type is not ClusterIP"
[ "$($K get svc web -o jsonpath='{.spec.ports[0].port}')" = 8080 ] || fail "service port is not 8080"
[ "$($K get svc web -o jsonpath='{.spec.ports[0].targetPort}')" = 80 ] || fail "targetPort is not 80"
img=$($K get deploy web -o jsonpath='{.spec.template.spec.containers[0].image}'); [ "$img" = nginx:1.27-alpine ] || fail "image was changed ($img)"
wait_available web 1 60 || fail "web pod not available"
in_cluster_get http://web.wg.svc:8080/ | grep -q "Welcome to nginx" || fail "http://web.wg.svc:8080/ does not answer"
ok "web answers on 8080 → 80"
