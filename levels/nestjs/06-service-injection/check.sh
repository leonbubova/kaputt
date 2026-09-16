source "$WG_ROOT/levels/nestjs/nest.sh"
boot_or_fail
[ "$(code $BASE/health/greeting)" = 200 ] || fail "GET /health/greeting answers $(code $BASE/health/greeting) — no @Get('greeting') route yet?"
get /health/greeting | grep -q 'hello from the service' || fail "GET /health/greeting answers $(get /health/greeting) — expected: hello from the service"
grep -q 'hello from the service' "$APP/src/health/health.service.ts" || fail "the text must come from a greeting() method in HealthService (src/health/health.service.ts), not from the controller"
grep -q 'this.health.greeting()' "$APP/src/health/health.controller.ts" || fail "the controller must call the injected service: return this.health.greeting()"
ok "/health/greeting comes from the service — the controller asked, Nest injected, the method answered"
