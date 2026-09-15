source ../../../lib/common.sh; source ../lib.sh
C="docker compose -f $WORK/compose.yaml"
wait_running wg-cache || fail "wg-cache not running"
docker inspect -f '{{.Config.Image}}' wg-cache | grep -q '^redis:7-alpine$' || fail "image changed"
marker=wg-$RANDOM
docker exec wg-cache redis-cli set wg_marker "$marker" >/dev/null && docker exec wg-cache redis-cli save >/dev/null || fail "cannot write to redis"
$C down >/dev/null 2>&1 || fail "compose down failed"; $C up -d >/dev/null 2>&1 || fail "compose up failed"
wait_running wg-cache || fail "wg-cache not running after redeploy"
i=0; while [ $i -lt 10 ]; do got=$(docker exec wg-cache redis-cli get wg_marker 2>/dev/null); [ "$got" = "$marker" ] && break; sleep 1; i=$((i+1)); done
[ "$got" = "$marker" ] || fail "key lost after down/up (got '$got')"
ok "data survives redeploy"
