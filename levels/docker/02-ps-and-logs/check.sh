source ../../../lib/common.sh; source ../lib.sh
docker inspect wg-secret >/dev/null 2>&1 || fail "wg-secret is gone — wg reset brings it back"
want=$(docker logs wg-secret 2>&1 | tr -d '[:space:]')
[ -f "$WORK/word.txt" ] || fail "no word.txt in ~/.k8s-wargame/docker/02-ps-and-logs/ yet"
got=$(tr -d '[:space:]' < "$WORK/word.txt")
[ "$got" = "$want" ] || fail "word.txt contains '$got' — docker logs wg-secret shows something else"
ok "word.txt holds what wg-secret printed — you read a container's output"
