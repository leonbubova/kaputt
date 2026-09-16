source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
need_repo
[ -s "$ANSWER" ] || fail "no answer in $ANSWER"
a=$(tr -d '\r' < "$ANSWER" | tr 'A-Z' 'a-z' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
case "$a" in "priya nair"|"priya nair <priya@example.com>"|"priya@example.com") ok "correct: Priya Nair";; *) fail "'$a' is not the author of the TIMEOUT line";; esac
