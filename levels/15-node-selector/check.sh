source ../../lib/common.sh
[ "$($K get pod trainer -o jsonpath='{.spec.nodeSelector.disktype}')" = ssd ] || fail "nodeSelector was removed"
$K wait --for=condition=Ready pod/trainer --timeout=60s >/dev/null 2>&1 || fail "trainer not Running"
node=$($K get pod trainer -o jsonpath='{.spec.nodeName}')
[ "$(kubectl get node "$node" -o jsonpath='{.metadata.labels.disktype}')" = ssd ] || fail "node $node is not labeled disktype=ssd"
ok "trainer on $node (disktype=ssd)"
