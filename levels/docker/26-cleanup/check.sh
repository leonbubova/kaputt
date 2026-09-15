source ../../../lib/common.sh; source ../lib.sh
running wg-web || fail "wg-web is not running anymore"
docker inspect -f '{{range .Mounts}}{{.Name}}{{end}}' wg-web | grep -q wg-web-data || fail "wg-web lost its volume"
docker exec wg-web cat /usr/share/nginx/html/index.html 2>/dev/null | grep -q "prod data" || fail "production data gone"
[ -z "$(docker images -q -f dangling=true -f label=wg.track=docker)" ] || fail "dangling build images still there"
[ -z "$(docker ps -aq -f 'name=^wg-old-')" ] || fail "stopped wg-old-* containers still there"
[ -z "$(docker volume ls -q -f 'name=^wg-old-')" ] || fail "wg-old-* volumes still there"
ok "cleaned up, prod intact"
