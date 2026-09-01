source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
need_repo
h feature/export >/dev/null || fail "feature/export does not exist"
[ "$(tree feature/export)" = "$(exp tree)" ] || fail "feature/export content differs from the deleted branch"
[ "$(g rev-list --count main..feature/export)" = 2 ] || fail "expected 2 commits on feature/export"
clean_tree || fail "working tree not clean"
ok "feature/export recovered"
