source ../../../lib/common.sh; source ../lib.sh
[ "$(rel_status shop)" = deployed ] || fail "release shop is not deployed ($(rel_status shop))"
$K get secret sh.helm.release.v1.shop.v1 >/dev/null 2>&1 || fail "revision 1 is gone — recover the release, don't reinstall it"
wait_available shop 2 90 || fail "shop does not have 2 available replicas"
in_cluster_get http://shop.wg-helm.svc/ | grep -q "<h1>shop</h1>" || fail "shop not reachable"
ok "release unstuck, chart 0.2.0 rolled out"
