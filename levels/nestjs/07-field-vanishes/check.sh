source "$WG_ROOT/levels/nestjs/nest.sh"
boot_or_fail
post /users '{"name":"Bob","email":"bob@x.io","role":"admin"}' > "$LOG.body"
grep -q '"email":"bob@x.io"' "$LOG.body" || fail "email is dropped on create"
grep -q admin "$LOG.body" && fail "unknown field role was not stripped (whitelist)"
[ "$(code -H 'content-type: application/json' -X POST -d '{"name":"Bob","email":"nope"}' $BASE/users)" = 400 ] || fail "invalid email should be 400"
[ "$(code -H 'content-type: application/json' -X POST -d '{}' $BASE/users)" = 400 ] || fail "empty body should be 400"
ok "email validated and kept"
