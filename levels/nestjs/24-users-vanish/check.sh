source "$WG_ROOT/levels/nestjs/nest.sh"
boot_or_fail
get /users | grep -q "Ada Lovelace" || fail "seed users missing from GET /users"
id=$(post /users '{"name":"Bob","email":"bob@x.io"}' | sed -n 's/.*"id":\([0-9]*\).*/\1/p'); [ -n "$id" ] || fail "POST /users failed"
get "/users/$id" | grep -q '"name":"Bob"' || fail "created user $id is gone on the next request"
get /users | grep -q '"name":"Bob"' || fail "created user not in GET /users"
ok "users persist in memory"
