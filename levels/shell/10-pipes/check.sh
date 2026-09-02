source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/shell/shelllib.sh"
want=$(grep -c vegetarian "$WORK/guests.txt")
have count.txt || fail "no count.txt in the sandbox yet"
got=$(squash "$(cat "$WORK/count.txt")")
[ "$got" = "$want" ] || fail "count.txt contains '$got' — expected the number $want (grep the lines, pipe them into wc -l)"
ok "$want vegetarians, counted by a pipeline"
