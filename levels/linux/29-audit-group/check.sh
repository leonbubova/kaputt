source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
X getent group audit >/dev/null 2>&1 || fail "group audit missing"
ga=$(X id -nG alice 2>/dev/null); gb=$(X id -nG bob 2>/dev/null)
for g in audit dev operators; do echo " $ga " | grep -q " $g " || fail "alice is not in $g (has: $ga)"; done
for g in audit dev; do echo " $gb " | grep -q " $g " || fail "bob is not in $g (has: $gb)"; done
[ "$(X id -gn alice)" = alice ] || fail "alice's primary group changed"
[ "$(X id -gn bob)" = bob ] || fail "bob's primary group changed"
ok "audit group in place, nobody lost anything"
