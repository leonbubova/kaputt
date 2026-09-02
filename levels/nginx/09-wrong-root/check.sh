source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
[ "$(code $URL/style.css)" = 200 ] || fail "/style.css returns $(code $URL/style.css), not 200"
body $URL/style.css | grep -q 'font-family' || fail "/style.css content missing"
ok "static assets served from the right root"
