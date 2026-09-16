source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/bash/bashlib.sh"
have answer.txt || fail "no answer.txt in ~/.k8s-wargame/bash/work yet — run ./mystery.sh, then echo \$?, then write the number into answer.txt"
got=$(trim "$(cat "$WORK/answer.txt")")
[ "$got" = 4 ] || fail "answer.txt says '$got' — that is not the exit code. Run ./mystery.sh and print \$? on the very next line"
ok "answer.txt holds 4 — you read an exit code with \$?"
