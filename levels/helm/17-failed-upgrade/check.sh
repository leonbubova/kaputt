source ../../../lib/common.sh; source ../lib.sh
[ "$(rel_status shop)" = deployed ] || fail "release shop is not deployed ($(rel_status shop))"
[ "$(rel_revs shop)" -ge 3 ] || fail "release history was thrown away — roll back, don't reinstall"
img=$($K get deploy shop -o jsonpath='{.spec.template.spec.containers[0].image}'); [ "$img" = nginx:1.27-alpine ] || fail "image is $img"
wait_available shop 3 90 || fail "shop does not have 3 available replicas"
in_cluster_get http://shop.wg-helm.svc/ | grep -q "env=prod" || fail "page does not show env=prod"
ok "shop rolled back and re-upgraded with 3 replicas"
