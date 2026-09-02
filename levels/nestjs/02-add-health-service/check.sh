source "$WG_ROOT/levels/nestjs/nest.sh"
boot_or_fail
get /health | grep -qE '"uptime":[0-9]+' || fail "GET /health has no numeric uptime"
get /health | grep -q '"status":"ok"' || fail "GET /health lost status: ok"
grep -rq '@Injectable' "$APP/src/health/" || fail "no @Injectable() service in src/health/"
grep -q 'constructor(' "$APP/src/health/health.controller.ts" || fail "HealthController must receive the service via constructor injection"
ok "/health served by an injected service"
