source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
[ -d "$REPO/.git" ] || fail "no .git folder in ~/.k8s-wargame/git/repo yet — cd there, then: git init"
[ -f "$REPO/hello.txt" ] || fail "hello.txt is gone from the folder — wg reset and only run git init"
ok "the folder is a repository now — git status works here"
