source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/bash/bashlib.sh"
have two.sh || fail "no two.sh in ~/.k8s-wargame/bash/work yet"
grep -q '\$1\|\${1}' "$WORK/two.sh" || fail "two.sh never reads \$1 — the names must come from the arguments"
out=$(run two.sh Ada Bob 2>&1); [ "$out" = "first: Ada
second: Bob" ] || fail "two.sh Ada Bob printed:
$out
— wanted two lines: 'first: Ada' and 'second: Bob'"
out=$(run two.sh red blue 2>&1); [ "$out" = "first: red
second: blue" ] || fail "two.sh red blue printed:
$out
— wanted 'first: red' and 'second: blue' (use \$1 and \$2, do not type the names into the file)"
ok "two.sh reads its arguments — \$1 and \$2"
