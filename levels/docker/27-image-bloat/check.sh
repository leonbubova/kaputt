source ../../../lib/common.sh; source ../lib.sh
docker image inspect wg-app:1.0 >/dev/null 2>&1 || fail "image wg-app:1.0 missing"
size=$(docker image inspect wg-app:1.0 -f '{{.Size}}'); mb=$((size/1048576))
[ "$size" -lt 20971520 ] || fail "wg-app:1.0 is ${mb} MB (want < 20 MB)"
docker run --rm wg-app:1.0 2>&1 | grep -q "app ok" || fail "wg-app:1.0 does not print 'app ok'"
[ -s "$WORK/.cache/build-artifacts.bin" ] || fail ".cache/build-artifacts.bin was deleted — not allowed"
ok "wg-app:1.0 is ${mb} MB"
