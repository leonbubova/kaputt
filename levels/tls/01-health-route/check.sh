source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
c=$(curl -s -o /dev/null -m 5 -w '%{http_code}' "$HURL/health")
[ "$c" = 200 ] || fail "http://:9080/health returns $c, not 200"
[ "$(curl -s -m 5 "$HURL/health")" = "ok" ] || fail "/health answers 200 but the body is not 'ok'"
ok "/health route serves ok"
