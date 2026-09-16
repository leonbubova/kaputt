source "$WG_ROOT/levels/nestjs/nest.sh"
boot_or_fail
[ "$(code $BASE/health)" = 200 ] || fail "GET /health answers $(code $BASE/health) — compare the Mapped {…} line in the boot log with the address"
get /health | grep -q '"status":"ok"' || fail "GET /health answers $(get /health) — status: ok expected"
ok "Mapped {/health, GET} is back — the boot log showed you the route Nest really had"
