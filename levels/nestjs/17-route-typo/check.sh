source "$WG_ROOT/levels/nestjs/nest.sh"
boot_or_fail
get /users/1 | grep -q "Ada Lovelace" || fail "GET /users/1 does not return Ada"
get /users/2 | grep -q "Grace Hopper" || fail "GET /users/2 does not return Grace"
[ "$(code $BASE/users/abc)" = 400 ] || fail "GET /users/abc should be 400"
ok "/users/:id works"
