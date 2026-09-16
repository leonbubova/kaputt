source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
[ -f "$ANSWER" ] || fail "no answer.txt yet — write the table name into ~/.k8s-wargame/postgres/answer.txt (from your normal shell, not inside psql)"
got=$(answer)
[ "$got" = pets ] || fail "answer.txt says '$got' — that is not the table with a column 'species'. Describe each table with \\d and look at the column names"
ok "pets is the table with a species column — you connected, listed the tables and read their columns"
