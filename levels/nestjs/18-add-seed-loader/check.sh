source "$WG_ROOT/levels/nestjs/nest.sh"
seed="$APP/seed/users.json"
app_cleanup() { [ -f "$seed.wg-bak" ] && mv -f "$seed.wg-bak" "$seed"; return 0; }
cp "$seed" "$seed.wg-bak"
cat > "$seed" <<'J'
[
  { "id": 1, "name": "Ada Lovelace", "email": "ada@example.com", "role": "admin" },
  { "id": 2, "name": "Grace Hopper", "email": "grace@example.com", "role": "user" },
  { "id": 3, "name": "Linus Torvalds", "email": "linus@example.com", "role": "user" },
  { "id": 7, "name": "Margaret Hamilton", "email": "margaret@example.com", "role": "admin" }
]
J
boot_or_fail
get /users | grep -q "Margaret Hamilton" || fail "a user added to seed/users.json does not show up in GET /users"
get /users/7 | grep -q "Margaret Hamilton" || fail "GET /users/7 (seeded id) fails"
post /users '{"name":"Bob","email":"bob@x.io"}' | grep -q '"id":8' || fail "created user should get id 8 (seed max 7 + 1)"
ok "users loaded from seed/users.json"
