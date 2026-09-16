source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
need_repo
[ "$(g symbolic-ref -q HEAD)" = refs/heads/feature/billing ] || fail "not on feature/billing"
[ "$(h HEAD)" = "$(exp base)" ] || fail "feature/billing does not point at the commit before"
[ "$(g rev-parse -q --verify :billing.py 2>/dev/null)" = "$(exp blob)" ] || fail "billing.py is not staged with its original content (git status)"
[ "$(g rev-parse -q --verify HEAD:billing.py 2>/dev/null)" ] && fail "billing.py is still committed"
[ -z "$(g diff --name-only)" ] || fail "unstaged changes in the working tree"
ok "commit undone, change staged"
