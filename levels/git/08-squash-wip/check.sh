source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
need_repo
[ "$(h main)" = "$(exp main)" ] || fail "main moved"
h feature/avatar >/dev/null || fail "feature/avatar is gone"
no_op_in_progress || fail "rebase still in progress"
[ "$(g rev-list --count main..feature/avatar)" = 1 ] || fail "expected 1 commit on top of main, got $(g rev-list --count main..feature/avatar)"
[ "$(h feature/avatar^)" = "$(h main)" ] || fail "feature/avatar is not based on main"
[ "$(tree feature/avatar)" = "$(exp tree)" ] || fail "final content changed"
msg=$(g log -1 --format=%s feature/avatar | tr 'A-Z' 'a-z'); case "$msg" in wip*|fix|"") fail "commit message '$msg' is not a real message";; esac
clean_tree || fail "working tree not clean"
ok "squashed into one commit"
