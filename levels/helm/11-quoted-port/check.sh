source ../../../lib/common.sh; source ../lib.sh
[ "$(rel_status web)" = deployed ] || fail "release web is not deployed"
[ "$($K get deploy web -o jsonpath='{.spec.template.spec.containers[0].ports[0].containerPort}')" = 80 ] || fail "container has no containerPort 80 — keep the port declared"
wait_available web 1 60 || fail "web has no available replica"
in_cluster_get http://web.wg-helm.svc/ | grep -q "<h1>web</h1>" || fail "web not reachable"
ok "port renders as integer, web deployed"
