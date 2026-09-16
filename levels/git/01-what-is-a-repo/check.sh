source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
need_repo
[ -s "$ANSWER" ] || fail "no ~/.k8s-wargame/git/answer yet — echo the id from git log --oneline into it"
got=$(head -1 "$ANSWER" | awk '{print $1}')
[ ${#got} -ge 4 ] || fail "answer '$got' is too short — the id is the first word of the git log --oneline line"
case "$(exp head)" in "$got"*) ok "that is the id of the one commit — you read the log";; *) fail "answer '$got' is not the commit id — git log --oneline, first word";; esac
