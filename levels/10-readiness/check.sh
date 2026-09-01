source ../../lib/common.sh
wait_available web 1 90 || fail "web not available"
in_cluster_get http://web.wg.svc/ | grep -q "Welcome to nginx" || fail "service does not answer"
ok "web reachable"
