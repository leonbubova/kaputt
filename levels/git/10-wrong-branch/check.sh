source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
need_repo
[ "$(h main)" = "$(exp base)" ] || fail "main does not point at origin/main"
h feature/search >/dev/null || fail "branch feature/search does not exist"
[ "$(h feature/search^)" = "$(h main)" ] || fail "feature/search is not one commit on top of main"
[ "$(tree feature/search)" = "$(exp tree)" ] || fail "feature/search does not contain the search work"
on_branch || fail "HEAD is detached"
clean_tree || fail "working tree not clean"
ok "main restored, work saved on feature/search"
