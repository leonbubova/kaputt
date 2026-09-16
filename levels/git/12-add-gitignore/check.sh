source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
need_repo
[ -f "$REPO/debug.log" ] || fail "debug.log deleted — ignore it, don't delete it"
g cat-file -e HEAD:.gitignore 2>/dev/null || fail ".gitignore not committed"
[ -z "$(g ls-files debug.log)" ] || fail "debug.log got tracked"
: > "$REPO/other.log"; g check-ignore -q other.log || { rm -f "$REPO/other.log"; fail "other.log is not ignored — rule must cover *.log"; }; rm -f "$REPO/other.log"
clean_tree || fail "git status not clean: $(g status --porcelain)"
ok "*.log ignored"
