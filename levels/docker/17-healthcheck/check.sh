source ../../../lib/common.sh; source ../lib.sh
wait_running wg-db || fail "wg-db not running"
t=30; [ -n "${WG_FAST:-}" ] && t=6; i=0
while [ $i -lt $t ]; do h=$(docker inspect -f '{{if .State.Health}}{{.State.Health.Status}}{{else}}none{{end}}' wg-db 2>/dev/null); [ "$h" = healthy ] && break; sleep 1; i=$((i+1)); done
[ "$h" = healthy ] || fail "wg-db health is '$h' (want healthy — keep a healthcheck)"
wait_running wg-app || fail "wg-app not running"
grep -q "service_healthy" "$WORK/compose.yaml" || fail "depends_on condition was removed"
ok "db healthy, app started"
