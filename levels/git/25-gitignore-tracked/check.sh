source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
need_repo
[ -z "$(g ls-files build/out.log)" ] || fail "build/out.log is still in the index"
g cat-file -e HEAD:build/out.log 2>/dev/null && fail "build/out.log is still in HEAD — commit the removal"
[ -f "$REPO/build/out.log" ] || fail "build/out.log deleted from disk — untrack, don't delete"
g show HEAD:.gitignore 2>/dev/null | grep -q '^build/$' || fail ".gitignore lost the build/ rule"
echo "build $(date)" > "$REPO/build/out.log"
clean_tree || fail "git status not clean after a build: $(g status --porcelain)"
ok "build/out.log untracked and ignored"
