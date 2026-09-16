source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
need_repo
[ "$(h main)" = "$(exp tip)" ] || fail "local main changed"
g remote get-url origin >/dev/null 2>&1 || fail "no remote named origin"
[ "$(og rev-parse --verify -q main)" = "$(exp tip)" ] || fail "remote main does not have our commits"
[ "$(h origin/main)" = "$(exp tip)" ] || fail "origin/main not updated — push from this repo"
ok "remote added, main pushed"
