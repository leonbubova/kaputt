source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
rm -rf "$REPO"; mkdir -p "$REPO"; : > "$EXPECT"; rm -f "$ANSWER"
wf hello.txt <<'F'
hello git
F
