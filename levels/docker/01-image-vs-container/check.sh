source ../../../lib/common.sh; source ../lib.sh
docker inspect wg-hello >/dev/null 2>&1 || fail "no container named wg-hello yet — docker run --name wg-hello alpine:3.20 echo ..."
[ "$(image_of wg-hello)" = alpine:3.20 ] || fail "wg-hello is from image $(image_of wg-hello), want alpine:3.20"
docker logs wg-hello 2>&1 | grep -qx 'hello from docker' || fail "wg-hello printed '$(docker logs wg-hello 2>&1 | head -1)' — it should print exactly: hello from docker"
ok "wg-hello ran and printed hello from docker — image to container, done"
