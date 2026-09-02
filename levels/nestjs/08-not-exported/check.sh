source "$WG_ROOT/levels/nestjs/nest.sh"
boot_or_fail
get /orders | grep -q keyboard || fail "GET /orders does not list orders"
post /orders '{"userId":1,"item":"cable","qty":1}' | grep -q '"item":"cable"' || fail "POST /orders for user 1 fails"
[ "$(code -H 'content-type: application/json' -X POST -d '{"userId":99,"item":"cable","qty":1}' $BASE/orders)" = 404 ] || fail "order for unknown user should be 404"
ok "orders work"
