source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
need_repo
[ "$(h HEAD)" != "$(exp base)" ] || fail "no new snapshot yet — change hello.txt, git add hello.txt, git commit -m \"...\""
[ "$(g rev-list --count HEAD)" = 2 ] || fail "expected exactly two snapshots, git log --oneline shows $(g rev-list --count HEAD)"
[ "$(g show HEAD:hello.txt | tr -d '\r' | head -1)" = "hello again" ] || fail "the new snapshot's hello.txt says '$(g show HEAD:hello.txt | head -1)' — wanted exactly: hello again"
clean_tree || fail "the change is not committed yet: $(g status --porcelain)"
ok "second snapshot taken — edit, diff, add, commit"
