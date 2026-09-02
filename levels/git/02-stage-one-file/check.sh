source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
need_repo
[ "$(h HEAD^)" = "$(exp base)" ] && [ "$(g rev-list --count HEAD)" = 2 ] || fail "expected exactly one new commit"
g show HEAD:app.py | grep -q '"ok", 200' || fail "app.py fix not committed"
[ "$(g show HEAD:notes.md)" = "# Notes" ] || fail "notes.md was committed too"
grep -q 'TODO' "$REPO/notes.md" || fail "notes.md changes lost from the working tree"
[ "$(g status --porcelain)" = " M notes.md" ] || fail "unexpected status: $(g status --porcelain)"
ok "only app.py committed"
