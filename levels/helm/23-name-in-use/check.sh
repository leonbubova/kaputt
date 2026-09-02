source ../../../lib/common.sh; source ../lib.sh
[ "$(rel_status shop)" = deployed ] || fail "release shop is not deployed"
wait_available shop 1 60 || fail "shop has no available replica"
in_cluster_get http://shop.wg-helm.svc/ | grep -q "<h1>shop</h1>" || fail "shop not reachable"
ok "shop reinstalled"
