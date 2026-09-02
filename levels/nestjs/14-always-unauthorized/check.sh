source "$WG_ROOT/levels/nestjs/nest.sh"
boot_or_fail
curl -s -m 5 -H 'X-Api-Key: wg-secret-key' $BASE/admin/stats | grep -q '"users":' || fail "correct key is rejected"
c=$(code $BASE/admin/stats); [ "$c" = 401 ] || [ "$c" = 403 ] || fail "missing key should be 401/403 (got $c)"
c=$(code -H 'X-Api-Key: wrong' $BASE/admin/stats); [ "$c" = 401 ] || [ "$c" = 403 ] || fail "wrong key should be 401/403 (got $c)"
ok "api key guard works"
