source ../../../lib/common.sh; source ../lib.sh
wait_running wg-web || fail "wg-web not running"
[ "$(image_of wg-web)" = nginx:1.27-alpine ] || fail "image changed"
[ "$(docker inspect -f '{{index .Config.Labels "com.docker.compose.project"}}' wg-web)" = wg ] || fail "wg-web must come from the compose stack"
docker inspect -f '{{json .Config.Healthcheck.Test}}' wg-web 2>/dev/null | grep -q "localhost" || fail "healthcheck must probe http://localhost/ (see docker inspect .Config.Healthcheck)"
t=30; [ -n "${WG_FAST:-}" ] && t=6; i=0
while [ $i -lt $t ]; do h=$(docker inspect -f '{{if .State.Health}}{{.State.Health.Status}}{{else}}none{{end}}' wg-web 2>/dev/null); [ "$h" = healthy ] && break; sleep 1; i=$((i+1)); done
[ "$h" = healthy ] || fail "wg-web health is '$h' (want healthy)"
ok "wg-web reports healthy"
