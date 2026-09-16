source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
grep -q 'location = /ping' "$CONF" || fail "default.conf has no 'location = /ping' block yet"
[ "$(code $URL/ping)" = 200 ] || fail "/ping does not return 200 (got $(code $URL/ping)) — did you reload?"
[ "$(body $URL/ping)" = pong ] || fail "/ping answers '$(body $URL/ping)', expected 'pong'"
ok "/ping answers pong — a location block, tested, reloaded"
