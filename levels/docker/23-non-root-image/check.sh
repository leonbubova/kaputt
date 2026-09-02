source ../../../lib/common.sh; source ../lib.sh
docker image inspect wg-tool:2 >/dev/null 2>&1 || fail "image wg-tool:2 does not exist — build it"
[ -n "$(docker image inspect -f '{{.Config.User}}' wg-tool:2)" ] || fail "image has no USER instruction"
uid=$(docker run --rm wg-tool:2 id -u 2>/dev/null); [ -n "$uid" ] && [ "$uid" != 0 ] || fail "container from wg-tool:2 runs as uid ${uid:-?}"
# the tool's CMD keeps running (sleep infinity) — run detached and read the log instead of piping an attached run
docker rm -f wg-tool-check >/dev/null 2>&1; docker run -d --name wg-tool-check wg-tool:2 >/dev/null 2>&1; sleep 1
out=$(docker logs wg-tool-check 2>&1); docker rm -f wg-tool-check >/dev/null 2>&1
echo "$out" | grep -q "tool running as uid $uid" || fail "CMD changed — keep the tool's start command"
ok "wg-tool:2 runs as uid $uid"
