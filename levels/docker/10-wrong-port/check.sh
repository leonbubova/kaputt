source ../../../lib/common.sh; source ../lib.sh
wait_running wg-web || fail "wg-web not running"
[ "$(image_of wg-web)" = nginx:1.27-alpine ] || fail "image changed"
http_get http://localhost:18009/ | grep -q "Welcome to nginx" || fail "http://localhost:18009/ does not serve nginx"
ok "web reachable on :18009"
