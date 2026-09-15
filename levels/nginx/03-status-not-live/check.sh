source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
[ "$(code $URL/status)" = 200 ] || fail "/status does not return 200"
[ "$(body $URL/status)" = up ] || fail "/status body is not exactly 'up'"
ok "/status answers up"
