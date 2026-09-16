source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
need_repo
h HEAD >/dev/null || fail "no snapshot yet — git add hello.txt, then git commit -m \"...\""
g cat-file -e HEAD:hello.txt 2>/dev/null || fail "the snapshot does not contain hello.txt — git add hello.txt first, then commit"
clean_tree || fail "something is still not committed: $(g status --porcelain)"
ok "first snapshot taken — git log --oneline shows it"
