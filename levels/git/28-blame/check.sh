source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
need_repo
[ -s "$ANSWER" ] || fail "no answer in $ANSWER"
a=$(tr -d '\r' < "$ANSWER" | tr 'A-Z' 'a-z' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
case "$a" in "mara vogt"|"mara vogt <mara@example.com>"|"mara@example.com") ok "correct: Mara Vogt";; *) fail "'$a' is not the author who set MAX_RETRIES to 0";; esac
