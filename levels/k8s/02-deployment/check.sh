source ../../../lib/common.sh
$K get deploy web >/dev/null 2>&1 || fail "no deployment web"
wait_available web 2 60 || fail "web does not have 2 available replicas"
img=$($K get deploy web -o jsonpath='{.spec.template.spec.containers[0].image}'); [ "$img" = nginx:1.27-alpine ] || fail "wrong image ($img)"
[ "$($K get deploy web -o jsonpath='{.metadata.labels.app}')" = web ] || fail "deployment is missing label app=web"
[ "$($K get deploy web -o jsonpath='{.spec.template.metadata.labels.app}')" = web ] || fail "pod template is missing label app=web"
ok "web: 2/2 available, labelled app=web"
