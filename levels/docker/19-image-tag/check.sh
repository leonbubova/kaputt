source ../../../lib/common.sh; source ../lib.sh
wait_running wg-web || fail "wg-web not running"
wait_running wg-cache || fail "wg-cache not running"
docker exec wg-cache redis-cli ping 2>/dev/null | grep -q PONG || fail "wg-cache does not answer PONG"
docker inspect -f '{{.Config.Image}}' wg-cache | grep -q '^redis:7' || fail "cache is not a redis 7 image"
ok "stack up"
