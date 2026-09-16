source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
dev_up; get /api/ping; want 200 "/api/ping"; body_has '"ok":true' "/api/ping body is not {\"ok\":true}"
[ "$(curl -s -o /dev/null -w '%{http_code}' -X POST http://localhost:$PORT/api/ping)" = 405 ] || fail "POST /api/ping should be 405 (only export GET)"
ok "GET /api/ping → {\"ok\":true}"
