source ../../../lib/common.sh; source ../lib.sh
running
conf_ok
[ "$(code $URL/health)" = 200 ] || fail "/health does not answer"
ok "nginx is back up"
