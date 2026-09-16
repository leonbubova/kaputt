source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
new_repo
wf hello.txt <<'F'
hello git
F
