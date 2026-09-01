source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
need_repo
[ -s "$ANSWER" ] || fail "no answer in $ANSWER"
a=$(tr -d ' \n\r\t' < "$ANSWER"); full=$(h "$a^{commit}") || fail "'$a' is not a commit in the repo"
[ "$full" = "$(exp bad)" ] || fail "wrong commit — $(g log -1 --format=%s "$full")"
no_op_in_progress || fail "bisect still running — git bisect reset"
[ "$(g symbolic-ref -q HEAD)" = refs/heads/main ] || fail "repo not back on main"
ok "culprit found"
