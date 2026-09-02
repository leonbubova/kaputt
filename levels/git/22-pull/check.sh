source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
need_repo
[ "$(g symbolic-ref -q HEAD)" = refs/heads/main ] || fail "not on main"
[ "$(h main)" = "$(exp theirs)" ] || fail "local main is not at the remote's commit"
[ "$(h origin/main)" = "$(exp theirs)" ] || fail "origin/main not updated — fetch it from this repo"
g cat-file -e HEAD:metrics.py 2>/dev/null || fail "metrics.py missing"
clean_tree || fail "working tree not clean"
ok "up to date with origin"
