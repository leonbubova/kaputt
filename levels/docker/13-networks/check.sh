source ../../../lib/common.sh; source ../lib.sh
wait_running wg-web || fail "wg-web not running"; wait_running wg-app || fail "wg-app not running"
docker network inspect wg-front wg-back >/dev/null 2>&1 || fail "networks wg-front/wg-back must both exist"
docker exec wg-app wget -qO- -T 3 http://web/ 2>/dev/null | grep -q "Welcome to nginx" || fail "wg-app cannot fetch http://web/"
ok "app reaches web"
