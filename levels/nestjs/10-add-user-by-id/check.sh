source "$WG_ROOT/levels/nestjs/nest.sh"
boot_or_fail
get /users/1 | grep -q "Ada Lovelace" || fail "GET /users/1 does not return Ada"
[ "$(code $BASE/users/abc)" = 400 ] || fail "GET /users/abc should be 400"
[ "$(code $BASE/users/999)" = 404 ] || fail "GET /users/999 should be 404"
get /users/999 | grep -qi "not found" || fail "404 body should say not found"
ok "/users/:id works"
