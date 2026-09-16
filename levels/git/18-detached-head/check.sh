source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
need_repo
on_branch || fail "HEAD is still detached"
h hotfix/timeout >/dev/null || fail "branch hotfix/timeout does not exist"
g merge-base --is-ancestor "$(exp fix)" hotfix/timeout 2>/dev/null || [ "$(tree hotfix/timeout)" = "$(exp tree)" ] || fail "hotfix/timeout does not contain the timeout commit"
g show hotfix/timeout:client.py 2>/dev/null | grep -q 'timeout=30' || fail "client.py on hotfix/timeout has no timeout=30"
clean_tree || fail "working tree not clean"
ok "commit rescued onto hotfix/timeout"
