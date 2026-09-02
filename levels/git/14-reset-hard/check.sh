source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
need_repo
[ "$(g symbolic-ref -q HEAD)" = refs/heads/main ] || fail "not on main"
[ "$(tree HEAD)" = "$(exp tree)" ] || fail "main does not have the pre-reset content"
[ "$(g rev-list --count HEAD)" = 3 ] || fail "expected 3 commits on main"
clean_tree || fail "working tree not clean"
ok "main recovered"
