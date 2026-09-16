source "$WG_ROOT/levels/nestjs/nest.sh"
boot_or_fail
get /users/1 | grep -q '"orderCount":2' || fail "GET /users/1 should report orderCount 2"
post /orders '{"userId":1,"item":"cable","qty":1}' | grep -q '"item":"cable"' || fail "POST /orders failed"
get /users/1 | grep -q '"orderCount":3' || fail "orderCount not updated after a new order"
[ "$(code -H 'content-type: application/json' -X POST -d '{"userId":99,"item":"x","qty":1}' $BASE/orders)" = 404 ] || fail "order for unknown user should stay 404"
ok "users report their order count"
