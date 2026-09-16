source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
need_repo
[ "$(h HEAD)" = "$(exp base)" ] || fail "second.txt was committed — this lesson stops after git add. wg reset and try again"
[ -f "$REPO/second.txt" ] || fail "no second.txt in the repo yet — echo second file > second.txt"
g ls-files --error-unmatch second.txt >/dev/null 2>&1 || fail "second.txt exists but is not staged — git add second.txt"
ok "second.txt is on the list for the next snapshot — staged, not committed"
