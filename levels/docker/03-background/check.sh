source ../../../lib/common.sh; source ../lib.sh
docker inspect wg-clock >/dev/null 2>&1 || fail "no container named wg-clock yet"
[ "$(image_of wg-clock)" = alpine:3.20 ] || fail "wg-clock is from image $(image_of wg-clock), want alpine:3.20"
wait_running wg-clock || fail "wg-clock exists but is not Up — its command must never finish: sleep infinity"
ok "wg-clock is Up and stays Up — a background container"
