source "$WG_ROOT/levels/nestjs/nest.sh"
boot_or_fail
get /users | grep -q "Ada Lovelace" || fail "GET /users does not list the seed users"
get /users/1 | grep -q '"orderCount"' || fail "GET /users/1 broken"
ok "app boots, /users works"
