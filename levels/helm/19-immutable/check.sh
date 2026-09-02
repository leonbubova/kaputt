source ../../../lib/common.sh; source ../lib.sh
[ "$(rel_status shop)" = deployed ] || fail "release shop is not deployed ($(rel_status shop))"
wait_available shop 2 90 || fail "shop does not have 2 available replicas"
body=$(in_cluster_get http://shop.wg-helm.svc/)
echo "$body" | grep -q "env=prod" || fail "page does not show env=prod"
echo "$body" | grep -q "domain=shop.example.com" || fail "page does not show the prod domain"
ok "prod config live"
