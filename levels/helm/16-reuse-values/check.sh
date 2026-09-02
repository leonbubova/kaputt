source ../../../lib/common.sh; source ../lib.sh
[ "$(rel_status shop)" = deployed ] || fail "release shop is not deployed"
wait_available shop 3 90 || fail "shop does not have 3 available replicas"
body=$(in_cluster_get http://shop.wg-helm.svc/)
echo "$body" | grep -q "domain=shop.example.com" || fail "page shows the wrong domain"
echo "$body" | grep -q "env=prod" || fail "page does not show env=prod"
ok "prod values restored, 3 replicas"
