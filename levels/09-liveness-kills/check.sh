source ../../lib/common.sh
wait_available web 1 60 || fail "web not available"
stable_for app=web 30 || fail "restarted within 30s"
in_cluster_get http://web.wg.svc/ | grep -q "Welcome to nginx" || fail "not reachable"
ok "web stable & reachable"
