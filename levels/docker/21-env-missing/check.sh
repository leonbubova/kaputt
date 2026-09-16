source ../../../lib/common.sh; source ../lib.sh
wait_running wg-api || fail "wg-api not running"
[ "$(image_of wg-api)" = wg-api:1.0 ] || fail "image changed"
docker run --rm wg-api:1.0 cat /app.sh 2>/dev/null | cmp -s - app.sh || fail "app.sh inside the image was modified"
docker logs wg-api 2>&1 | grep -q "api ready" || fail "logs do not say 'api ready'"
ok "api up"
