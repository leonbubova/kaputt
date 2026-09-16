source ../../../lib/common.sh; source ../lib.sh
docker inspect wg-greet >/dev/null 2>&1 || fail "no container named wg-greet yet"
[ "$(image_of wg-greet)" = alpine:3.20 ] || fail "wg-greet is from image $(image_of wg-greet), want alpine:3.20"
wait_running wg-greet || fail "wg-greet is not Up — background + sleep infinity, like lesson 3"
got=$(docker exec wg-greet printenv GREETING 2>/dev/null || true)
[ "$got" = hello ] || fail "inside wg-greet GREETING is '$got', want hello — set it at start with -e GREETING=hello"
ok "wg-greet has GREETING=hello — you configured a container and looked inside it"
