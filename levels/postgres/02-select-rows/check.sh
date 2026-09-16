source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
[ -f "$ANSWER" ] || fail "no answer.txt yet — write the name into ~/.k8s-wargame/postgres/answer.txt"
got=$(answer)
[ "$got" = simba ] || fail "answer.txt says '$got' — that is not the name of the pet with id 6. Run: select * from pets;  and read the row whose id column is 6"
ok "Simba is pet 6 — you read rows with SELECT"
