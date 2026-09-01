source ../../../lib/common.sh
wait_available cache 1 60 || fail "cache not available"
stable_for app=cache 15 || fail "still restarting"
$K logs deploy/cache | grep -q "cache ready" || fail "never reached 'cache ready'"
ok "cache stable"
