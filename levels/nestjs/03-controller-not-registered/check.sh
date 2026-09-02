source "$WG_ROOT/levels/nestjs/nest.sh"
boot_or_fail
[ "$(code $BASE/health)" = 200 ] || fail "GET /health is not 200"
get /health | grep -q '"status":"ok"' || fail "GET /health body has no status: ok"
ok "/health answers"
