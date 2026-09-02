source ../../../lib/common.sh; source ../lib.sh
wait_running wg-web || fail "wg-web not running"; wait_running wg-app || fail "wg-app not running"
docker network inspect wg-back >/dev/null 2>&1 || fail "network wg-back does not exist"
[ "$(docker network inspect -f '{{index .Labels "com.docker.compose.project"}}' wg-back)" = wg ] || fail "wg-back was not created by compose — declare it in compose.yaml"
for c in wg-web wg-app; do docker inspect -f '{{range $k,$v := .NetworkSettings.Networks}}{{$k}} {{end}}' $c | grep -qw wg-back || fail "$c is not on wg-back"; done
docker exec wg-app wget -qO- -T 3 http://web/ 2>/dev/null | grep -q "Welcome to nginx" || fail "wg-app cannot fetch http://web/"
ok "web and app share wg-back"
