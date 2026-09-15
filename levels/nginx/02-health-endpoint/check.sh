source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
[ "$(code $URL/health)" = 200 ] || fail "/health does not return 200"
[ "$(body $URL/health)" = ok ] || fail "/health body is not exactly 'ok'"
ok "/health returns ok"
