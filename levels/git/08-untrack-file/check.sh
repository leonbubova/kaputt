source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
need_repo
[ -f "$REPO/coverage.xml" ] || fail "coverage.xml was deleted from disk — untrack it, don't delete it"
[ -z "$(g ls-files coverage.xml)" ] || fail "coverage.xml is still tracked"
g cat-file -e HEAD:coverage.xml 2>/dev/null && fail "coverage.xml is still in HEAD — commit the removal"
g cat-file -e HEAD:tests.py 2>/dev/null || fail "tests.py is no longer committed"
[ "$(h HEAD^)" = "$(exp base)" ] && [ "$(g rev-list --count HEAD)" = 3 ] || fail "expected exactly one new commit on top of the existing two"
[ -z "$(g status --porcelain | grep -v '^?? coverage.xml$')" ] || fail "working tree not clean (apart from the untracked coverage.xml)"
ok "coverage.xml untracked, still on disk"
