source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/shell/shelllib.sh"
have diary.txt || fail "diary.txt is gone — wg reset, then append with >>"
n=$(awk 'END{print NR}' "$WORK/diary.txt")
l1=$(sed -n 1p "$WORK/diary.txt"); l2=$(sed -n 2p "$WORK/diary.txt"); l3=$(sed -n 3p "$WORK/diary.txt" | tr 'A-Z' 'a-z')
if [ "$n" -eq 1 ] && echo "$l1" | grep -qi 'day three'; then
  fail "days one and two are gone — a single > replaced the whole file. wg reset, then use >> to append"
fi
[ "$l1" = "day one: opened a terminal" ] && [ "$l2" = "day two: made a folder" ] || fail "the first two lines changed — wg reset and append with >> instead"
[ "$n" -eq 3 ] || fail "diary.txt has $n lines, expected 3 — exactly one new line at the end"
echo "$l3" | grep -q 'day three' || fail "line 3 is '$l3' — expected: day three: learned redirection"
ok "day three is in the diary, days one and two survived — that is >>"
