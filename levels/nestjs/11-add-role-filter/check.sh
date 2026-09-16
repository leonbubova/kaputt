source "$WG_ROOT/levels/nestjs/nest.sh"
boot_or_fail
a=$(get '/users?role=admin'); echo "$a" | grep -q "Ada Lovelace" || fail "?role=admin should include Ada"
echo "$a" | grep -q "Grace Hopper" && fail "?role=admin must not include Grace (role user)"
u=$(get '/users?role=user'); echo "$u" | grep -q "Grace Hopper" || fail "?role=user should include Grace"
echo "$u" | grep -q "Ada Lovelace" && fail "?role=user must not include Ada"
all=$(get /users); for n in Ada Grace Linus; do echo "$all" | grep -q "$n" || fail "GET /users lost $n"; done
ok "role filter works"
