source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
need_repo
[ -d "$ORIGIN" ] || fail "origin.git is gone"
[ "$(og rev-parse --verify -q main)" = "$(exp tip)" ] || fail "remote main does not have the local commit"
[ "$(h origin/main)" = "$(exp tip)" ] || fail "origin/main tracking ref not updated — was it really pushed from this repo?"
g ls-remote --exit-code origin main >/dev/null 2>&1 || fail "remote origin still unreachable"
ok "remote fixed, pushed"
