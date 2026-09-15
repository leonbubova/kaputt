source ../../../lib/common.sh
wait_available web 2 60 || fail "web pods not available"
in_cluster_get http://web.wg.svc/ | grep -q "Welcome to nginx" || fail "service does not answer"
ok "web reachable via service"
