source ../../../lib/common.sh
$K get deploy web >/dev/null 2>&1 || fail "no deployment web"
r=$($K get deploy web -o jsonpath='{.spec.template.spec.containers[0].resources}')
[ "$($K get deploy web -o jsonpath='{.spec.template.spec.containers[0].resources.requests.cpu}')" = 100m ] || fail "requests.cpu is not 100m ($r)"
[ "$($K get deploy web -o jsonpath='{.spec.template.spec.containers[0].resources.requests.memory}')" = 64Mi ] || fail "requests.memory is not 64Mi ($r)"
[ "$($K get deploy web -o jsonpath='{.spec.template.spec.containers[0].resources.limits.cpu}')" = 200m ] || fail "limits.cpu is not 200m ($r)"
[ "$($K get deploy web -o jsonpath='{.spec.template.spec.containers[0].resources.limits.memory}')" = 128Mi ] || fail "limits.memory is not 128Mi ($r)"
wait_available web 2 90 || fail "web does not have 2 available replicas"
ok "web 2/2 with requests 100m/64Mi, limits 200m/128Mi"
