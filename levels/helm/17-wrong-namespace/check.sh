source ../../../lib/common.sh; source ../lib.sh
[ "$(rel_status shop)" = deployed ] || fail "release shop is not deployed in wg-helm"
[ -z "$(helm list -n wg-helm-staging -q --filter '^shop$' 2>/dev/null)" ] || fail "release shop still installed in wg-helm-staging"
[ "$(kubectl get deploy -n wg-helm-staging --no-headers 2>/dev/null | wc -l | tr -d ' ')" = 0 ] || fail "workloads left behind in wg-helm-staging"
wait_available shop 1 60 || fail "shop has no available replica in wg-helm"
in_cluster_get http://shop.wg-helm.svc/ | grep -q "<h1>shop</h1>" || fail "shop not reachable in wg-helm"
ok "shop lives in wg-helm only"
