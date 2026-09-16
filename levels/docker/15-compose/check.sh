source ../../../lib/common.sh; source ../lib.sh
wait_running wg-web || fail "wg-web not running"; wait_running wg-cache || fail "wg-cache not running"
for c in wg-web wg-cache; do [ "$(docker inspect -f '{{index .Config.Labels "com.docker.compose.project"}}' $c)" = wg ] || fail "$c was not started by compose project wg"; done
[ "$(image_of wg-web)" = nginx:1.27-alpine ] || fail "web image is $(image_of wg-web)"
image_of wg-cache | grep -q '^redis:7' || fail "cache image is $(image_of wg-cache)"
http_get http://localhost:18007/ | grep -q "Welcome to nginx" || fail "http://localhost:18007/ does not answer"
docker exec wg-cache redis-cli ping 2>/dev/null | grep -q PONG || fail "wg-cache does not PONG"
ok "compose stack wg is up"
