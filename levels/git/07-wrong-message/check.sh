source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
need_repo
msg=$(g log -1 --format=%s); [ "$msg" = "Add login endpoint" ] || fail "last commit message is '$msg'"
[ "$(h HEAD^)" = "$(exp base)" ] || fail "history below the last commit changed"
[ "$(tree HEAD)" = "$(exp tree)" ] || fail "content of the last commit changed"
[ "$(g rev-list --count HEAD)" = 3 ] || fail "expected 3 commits, got $(g rev-list --count HEAD)"
clean_tree || fail "working tree not clean"
ok "message fixed, history intact"
