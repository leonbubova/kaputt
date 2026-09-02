source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
need_repo
grep -q '^## Chapter 1: Onboarding' "$REPO/draft.md" 2>/dev/null || fail "draft.md has no chapter 1"
grep -q 'ships one small fix to production' "$REPO/draft.md" || fail "chapter 1 text incomplete"
ok "stash content recovered"
