source "$WG_ROOT/levels/nestjs/nest.sh"
boot_or_fail
get /orders | grep -q '^{"data":\[' || fail "GET /orders not wrapped in { data }"
get /health | grep -q '^{"data":{' || fail "GET /health not wrapped in { data }"
curl -s -m 5 -H 'X-Api-Key: wg-secret-key' $BASE/admin/stats | grep -q '^{"data":{"users"' || fail "GET /admin/stats not wrapped in { data }"
ok "responses wrapped"
