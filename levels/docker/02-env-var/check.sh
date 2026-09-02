source ../../../lib/common.sh; source ../lib.sh
wait_running wg-app || fail "no running container named wg-app"
[ "$(image_of wg-app)" = alpine:3.20 ] || fail "image is $(image_of wg-app), want alpine:3.20"
[ "$(docker exec wg-app printenv REGION 2>/dev/null)" = eu-central ] || fail "REGION is not eu-central inside wg-app"
ok "wg-app has REGION=eu-central"
