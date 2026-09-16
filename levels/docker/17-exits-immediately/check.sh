source ../../../lib/common.sh; source ../lib.sh
wait_running wg-worker || fail "wg-worker is not running (status: $(docker inspect -f '{{.State.Status}}' wg-worker 2>/dev/null || echo missing))"
[ "$(image_of wg-worker)" = alpine:3.20 ] || fail "image changed ($(image_of wg-worker))"
docker logs wg-worker 2>&1 | grep -q "worker ready" || fail "logs do not say 'worker ready'"
ok "wg-worker is up"
