source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
need_repo
[ "$(h main)" = "$(exp main)" ] || fail "main moved"
h feature/greeting >/dev/null || fail "branch feature/greeting does not exist"
[ "$(h feature/greeting^)" = "$(h main)" ] && [ "$(g rev-list --count main..feature/greeting)" = 1 ] || fail "feature/greeting must be exactly one commit on top of main"
g show feature/greeting:greeting.py 2>/dev/null | grep -q 'def greet' || fail "greeting.py with 'def greet' not on feature/greeting"
[ "$(g symbolic-ref -q HEAD)" = refs/heads/main ] || fail "HEAD is not on main"
clean_tree || fail "working tree not clean"
ok "branch created, back on main"
