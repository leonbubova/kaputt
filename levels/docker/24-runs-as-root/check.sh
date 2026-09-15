source ../../../lib/common.sh; source ../lib.sh
wait_running wg-api || fail "wg-api not running"
[ "$(image_of wg-api)" = wg-api:1.0 ] || fail "container must run wg-api:1.0"
uid=$(docker exec wg-api id -u 2>/dev/null); [ -n "$uid" ] && [ "$uid" != 0 ] || fail "process runs as uid ${uid:-?}"
[ "$(docker inspect -f '{{.Config.User}}' wg-api)" = "$(docker image inspect -f '{{.Config.User}}' wg-api:1.0)" ] || fail "user set at runtime — must come from the image"
[ -n "$(docker image inspect -f '{{.Config.User}}' wg-api:1.0)" ] || fail "image has no USER"
docker run --rm --entrypoint cat wg-api:1.0 /app/app.sh 2>/dev/null | cmp -s - app.sh || fail "app.sh was modified"
docker logs wg-api 2>&1 | grep -q "api ready" || fail "app did not start cleanly (see docker logs wg-api)"
ok "api runs as uid $uid"
