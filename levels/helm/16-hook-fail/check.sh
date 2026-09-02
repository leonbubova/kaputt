source ../../../lib/common.sh; source ../lib.sh
[ "$(rel_status web)" = deployed ] || fail "release web is not deployed ($(rel_status web))"
[ "$($K get job web-migrate -o jsonpath='{.status.succeeded}' 2>/dev/null)" = 1 ] || fail "migration job web-migrate did not succeed (don't remove the hook)"
wait_available web 1 60 || fail "web has no available replica"
in_cluster_get http://web.wg-helm.svc/ | grep -q "<h1>web</h1>" || fail "web not reachable"
ok "migration hook ran, web deployed"
