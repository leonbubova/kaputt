source "$WG_ROOT/levels/nestjs/nest.sh"
boot_or_fail
[ "$(code $BASE/health)" = 200 ] || fail "GET /health is not 200"
get /health | grep -q '"status":"ok"' || fail "GET /health body must contain status: ok"
ls "$APP"/src/health/*.controller.ts >/dev/null 2>&1 || fail "expected a controller file in src/health/"
ok "/health is live"
