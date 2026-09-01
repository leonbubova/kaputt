source ../../lib/common.sh
wait_available worker 1 60 || fail "worker not available"
ok "worker scheduled and running"
