source "$WG_ROOT/levels/nestjs/nest.sh"
spec="$APP/src/orders/orders.service.spec.ts"; [ -f "$spec" ] || fail "spec file deleted"
[ "$(grep -c '^ *it(' "$spec")" -ge 4 ] || fail "spec must keep its 4 tests"
grep -q 'UsersModule' "$spec" && fail "don't import the real UsersModule — mock the dependency"
out=$(cd "$APP" && ./node_modules/.bin/jest src/orders 2>&1) || { echo "$out" | grep -m1 -E "resolve|●" | cut -c1-160; fail "jest fails"; }
echo "$out" | grep -qE 'Tests: +[4-9][0-9]* passed' || fail "expected ≥4 passing tests"
ok "unit test green"
