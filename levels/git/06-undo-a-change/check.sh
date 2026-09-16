source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
need_repo
[ "$(h HEAD)" = "$(exp base)" ] || fail "a new commit was made — the task was to undo, not to commit. wg reset and use git restore"
[ "$(head -1 "$REPO/hello.txt" 2>/dev/null)" = "hello git" ] || fail "hello.txt still says '$(head -1 "$REPO/hello.txt" 2>/dev/null)' — git restore hello.txt"
clean_tree || fail "working tree not clean: $(g status --porcelain)"
ok "hello.txt is back to the snapshot — an uncommitted change undone"
