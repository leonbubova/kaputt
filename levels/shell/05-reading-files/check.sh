source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/shell/shelllib.sh"
want=$(sed -n 's/.*secret word is: //p' "$WORK/letter.txt" | tr -d ' \r')
have answer.txt || fail "no answer.txt in the sandbox yet — read letter.txt, then write the secret word into answer.txt"
got=$(word_in answer.txt)
[ "$got" = "$want" ] || fail "answer.txt says '$got' — that is not the secret word from letter.txt. cat letter.txt and look again"
ok "you found the secret word: $want"
