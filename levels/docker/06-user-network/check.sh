source ../../../lib/common.sh; source ../lib.sh
docker network inspect wg-net >/dev/null 2>&1 || fail "network wg-net does not exist"
wait_running wg-a || fail "wg-a not running"; wait_running wg-b || fail "wg-b not running"
for c in wg-a wg-b; do docker inspect -f '{{range $k,$v := .NetworkSettings.Networks}}{{$k}} {{end}}' $c | grep -qw wg-net || fail "$c is not on wg-net"; done
docker exec wg-a wget -qO- -T 3 http://wg-b/ 2>/dev/null | grep -q "Welcome to nginx" || fail "wg-a cannot fetch http://wg-b/"
ok "wg-a reaches wg-b by name"
