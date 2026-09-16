source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
need_repo
[ "$(h feature/greeting)" = "$(exp feat)" ] || fail "feature/greeting changed"
[ "$(h main)" = "$(exp feat)" ] || fail "main is not at feature/greeting's commit (fast-forward, no merge commit)"
[ "$(g symbolic-ref -q HEAD)" = refs/heads/main ] || fail "HEAD is not on main"
clean_tree || fail "working tree not clean"
ok "fast-forwarded"
