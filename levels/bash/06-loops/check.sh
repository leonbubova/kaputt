source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/bash/bashlib.sh"
have fruits.sh || fail "no fruits.sh in ~/.k8s-wargame/bash/work yet"
grep -Eq '^[^#]*(^|[^A-Za-z_])for +[A-Za-z_][A-Za-z_0-9]* +in ' "$WORK/fruits.sh" || fail "fruits.sh has no for loop — the lesson is the loop, not three echos"
[ "$(grep -c 'echo' "$WORK/fruits.sh")" = 1 ] || fail "fruits.sh has more than one echo — one echo inside the loop is enough"
out=$(run fruits.sh 2>&1); [ "$out" = "apple
pear
plum" ] || fail "fruits.sh printed:
$out
— wanted three lines: apple, pear, plum"
ok "fruits.sh loops — for, do, done"
