source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
need_repo
[ "$(g symbolic-ref -q HEAD)" = refs/heads/main ] || fail "not on main"
[ "$(h feature/i18n)" = "$(exp feat)" ] || fail "feature/i18n moved — merge INTO main"
no_op_in_progress || fail "merge still in progress"
clean_tree || fail "working tree not clean"
[ "$(g rev-list --parents -1 HEAD | wc -w | tr -d ' ')" = 3 ] || fail "main's tip is not a merge commit"
p="$(h HEAD^1) $(h HEAD^2)"; case "$p" in *"$(exp main)"*) ;; *) fail "merge does not include the old main tip";; esac
case "$p" in *"$(exp feat)"*) ;; *) fail "merge does not include feature/i18n";; esac
g cat-file -e HEAD:i18n.py 2>/dev/null && g cat-file -e HEAD:hotfix.py 2>/dev/null || fail "i18n.py or hotfix.py missing on main"
ok "merged with a merge commit"
