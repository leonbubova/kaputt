source "$WG_ROOT/levels/nestjs/nest.sh"
boot_or_fail
curl -s -m 5 -H 'X-Api-Key: wg-secret-key' $BASE/admin/stats | grep -q '"users":' || fail "correct key gets $(code -H 'X-Api-Key: wg-secret-key' $BASE/admin/stats)"
c=$(code $BASE/admin/stats); [ "$c" = 401 ] || [ "$c" = 403 ] || fail "missing key should be 401/403 (got $c)"
c=$(code -H 'X-Api-Key: wrong' $BASE/admin/stats); [ "$c" = 401 ] || [ "$c" = 403 ] || fail "wrong key should be 401/403 (got $c)"
[ "$(code $BASE/users)" = 200 ] || fail "GET /users must stay open"
grep -rq 'CanActivate' "$APP/src/admin/" || fail "expected a CanActivate guard in src/admin/"
grep -q '@UseGuards' "$APP/src/admin/admin.controller.ts" || fail "AdminController must bind the guard with @UseGuards"
ok "/admin/stats guarded"
