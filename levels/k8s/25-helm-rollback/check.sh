source ../../../lib/common.sh
st=$(helm status shop -n $NS -o json 2>/dev/null | grep -o '"status":"[a-z-]*"' | head -1)
[[ "$st" == *deployed* ]] || fail "release status is $st (want deployed)"
wait_available shop 1 60 || fail "shop not available"
in_cluster_get http://shop.wg.svc/ | grep -q "Welcome to nginx" || fail "shop not reachable"
ok "release shop healthy"
