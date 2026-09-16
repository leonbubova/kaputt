source ../../../lib/common.sh
NOTES="$HOME/.k8s-wargame/k8s"
[ -f "$NOTES/word.txt" ] || fail "no ~/.k8s-wargame/k8s/word.txt yet — read kubectl logs talker, then echo the word into the file"
got=$(tr -d ' \t\r\n.' < "$NOTES/word.txt" | tr 'A-Z' 'a-z')
[ "$got" = tangerine ] || fail "word.txt contains '$got' — that is not the word from the logs of talker"
ok "word.txt holds the secret word — you read a pod's logs"
