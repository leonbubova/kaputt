source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
need_repo
h experiment >/dev/null || fail "no branch called experiment yet — git switch -c experiment"
[ "$(g symbolic-ref -q HEAD)" = refs/heads/experiment ] || fail "experiment exists but you are on $(g branch --show-current) — git switch experiment"
[ "$(h main)" = "$(exp base)" ] || fail "main moved — it should stay where it was"
ok "you are on experiment — main is untouched"
