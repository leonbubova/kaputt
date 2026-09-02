source ../../../lib/common.sh; source ../lib.sh
[ "$(rel_status shop)" = deployed ] || fail "release shop is not deployed"
wait_available shop 2 60 || fail "shop does not have 2 available replicas"
body=$(in_cluster_get http://shop.wg-helm.svc/)
echo "$body" | grep -q "domain=shop.example.com" || fail "page does not show domain=shop.example.com"
echo "$body" | grep -q "env=prod" || fail "page does not show env=prod"
ok "shop deployed with prod values"
