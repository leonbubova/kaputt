source ../../../lib/common.sh; source ../lib.sh
X pgrep -x nginx >/dev/null 2>&1 || fail "nginx is not running"
inurl localhost:8080 | grep -q 'api ok' || fail "8080 does not return 'api ok' (still squatted?)"
ok "port freed, nginx serving 8080"
