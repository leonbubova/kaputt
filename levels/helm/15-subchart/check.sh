source ../../../lib/common.sh; source ../lib.sh
[ "$(rel_status shop)" = deployed ] || fail "release shop is not deployed"
helm get manifest shop -n $NS | grep -q "name: shop-cache" || fail "the cache subchart is not part of the release"
wait_available shop-cache 1 60 || fail "shop-cache not available"
wait_available shop 1 90 || fail "shop has no available replica"
in_cluster_get http://shop.wg-helm.svc/ | grep -q "<h1>shop</h1>" || fail "shop not reachable"
ok "cache subchart enabled, shop is up"
