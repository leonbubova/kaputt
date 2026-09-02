source ../../../lib/common.sh; source ../lib.sh
wait_running wg-worker || fail "wg-worker not running (start it first)"
[ "$(image_of wg-worker)" = alpine:3.20 ] || fail "image changed"
before=$(docker inspect -f '{{.State.StartedAt}}' wg-worker)
docker exec wg-worker pkill -9 sleep >/dev/null 2>&1 || true; sleep 1
t=15; [ -n "${WG_FAST:-}" ] && t=6; i=0
while [ $i -lt $t ]; do running wg-worker && [ "$(docker inspect -f '{{.State.StartedAt}}' wg-worker)" != "$before" ] && break; sleep 1; i=$((i+1)); done
running wg-worker && [ "$(docker inspect -f '{{.State.StartedAt}}' wg-worker)" != "$before" ] || fail "wg-worker did not come back after the crash"
ok "worker restarts on its own"
