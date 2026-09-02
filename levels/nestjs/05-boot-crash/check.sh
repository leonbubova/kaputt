source "$WG_ROOT/levels/nestjs/nest.sh"
grep -rq 'users.json' "$APP/src" || fail "seed must still be loaded from seed/users.json"
boot_or_fail
body=$(get /users)
for n in "Ada Lovelace" "Grace Hopper" "Linus Torvalds"; do echo "$body" | grep -q "$n" || fail "seed user $n missing"; done
ok "seed loaded, app up"
