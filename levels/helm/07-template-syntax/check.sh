source ../../../lib/common.sh; source ../lib.sh
[ "$(rel_status web)" = deployed ] || fail "release web is not deployed ($(rel_status web))"
wait_available web 1 60 || fail "web has no available replica"
img=$($K get deploy web -o jsonpath='{.spec.template.spec.containers[0].image}'); [ "$img" = nginx:1.27-alpine ] || fail "image is $img"
$K get deploy web -o jsonpath='{.spec.template.spec.containers[0].resources.limits.memory}' | grep -q 64Mi || fail "resources block missing — don't delete it, close it"
in_cluster_get http://web.wg-helm.svc/ | grep -q "<h1>web</h1>" || fail "web not reachable"
ok "release web deployed and serving"
