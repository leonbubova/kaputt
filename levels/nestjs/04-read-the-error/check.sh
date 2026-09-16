source "$WG_ROOT/levels/nestjs/nest.sh"
boot_or_fail
[ "$(code $BASE/health)" = 200 ] || fail "server starts, but GET /health answers $(code $BASE/health)"
get /health | grep -q '"status":"ok"' || fail "GET /health answers $(get /health) — status: ok expected"
ok "the server starts again and /health answers — you read an error line: file, line, column, problem"
