source "$WG_ROOT/levels/nestjs/nest.sh"
boot_or_fail
[ "$(code -H 'content-type: application/json' -X POST -d '{}' $BASE/users)" = 400 ] || fail "POST {} should be 400"
[ "$(code -H 'content-type: application/json' -X POST -d '{"name":"Bob","email":"nope"}' $BASE/users)" = 400 ] || fail "invalid email should be 400"
[ "$(code -H 'content-type: application/json' -X POST -d '{"name":"Bob","email":"bob@x.io"}' $BASE/users)" = 201 ] || fail "valid POST should be 201"
post /users '{"name":"Carl","email":"carl@x.io"}' | grep -q '"name":"Carl"' || fail "response should contain the created user"
get /users | grep -q '"name":"Carl"' || fail "created user missing from GET /users"
ok "POST /users validates and creates"
