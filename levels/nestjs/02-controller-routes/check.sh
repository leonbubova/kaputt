source "$WG_ROOT/levels/nestjs/nest.sh"
boot_or_fail
[ "$(code $BASE/health/ping)" = 200 ] || fail "GET /health/ping answers $(code $BASE/health/ping) — no @Get('ping') method in HealthController yet?"
get /health/ping | grep -q 'pong' || fail "GET /health/ping answers $(get /health/ping) — it must return the text pong"
[ "$(code $BASE/health)" = 200 ] || fail "GET /health broke — keep the check() route"
ok "GET /health/ping answers pong — one method, one route"
