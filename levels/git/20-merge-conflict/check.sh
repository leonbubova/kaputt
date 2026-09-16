source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
need_repo
[ "$(g symbolic-ref -q HEAD)" = refs/heads/main ] || fail "not on main"
no_op_in_progress || fail "merge still in progress"
clean_tree || fail "working tree not clean"
[ "$(g rev-list --parents -1 HEAD | wc -w | tr -d ' ')" = 3 ] || fail "HEAD is not a merge commit"
p="$(h HEAD^1) $(h HEAD^2)"; case "$p" in *"$(exp main)"*) ;; *) fail "merge does not include the old main tip";; esac
case "$p" in *"$(exp feat)"*) ;; *) fail "merge does not include feature/timeouts";; esac
c=$(g show HEAD:config.yaml); echo "$c" | grep -q '^retries: 5$' || fail "retries: 5 missing"
echo "$c" | grep -q '^timeout: 30$' || fail "timeout: 30 missing"
echo "$c" | grep -Eq '^(<<<<<<<|=======|>>>>>>>)' && fail "conflict markers left in config.yaml"
ok "merged with both changes"
