source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/shell/shelllib.sh"
have colors.txt || fail "no colors.txt in the sandbox yet"
got=$(squash "$(tr 'A-Z' 'a-z' < "$WORK/colors.txt")")
[ "$got" = "red green blue" ] || fail "colors.txt contains '$got' — wanted: red green blue (three arguments to echo)"
ok "colors.txt holds red green blue — three arguments, one command"
