source "$WG_ROOT/levels/nestjs/nest.sh"
boot_or_fail
[ "$(code $BASE/health)" = 200 ] || fail "GET /health answers $(code $BASE/health) — is HealthController in the controllers list of AppModule?"
get /health | grep -q '"status":"ok"' || fail "GET /health answers $(get /health) — status: ok expected"
grep -q 'HealthController' "$APP/src/app.module.ts" || fail "/health answers, but not through AppModule — register HealthController in src/app.module.ts"
ok "AppModule lists HealthController again — a class exists for Nest only once a module lists it"
