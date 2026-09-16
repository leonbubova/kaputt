source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
new_repo
wf hello.txt <<'F'
hello git
F
cm "First snapshot"
rec base "$(h HEAD)"
wf hello.txt <<'F'
asdkjh ASDF ;;; broken broken broken
F
