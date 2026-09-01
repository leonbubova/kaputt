source ../../lib/common.sh
[ "$($K get pvc db-data -o jsonpath='{.status.phase}')" = Bound ] || fail "pvc db-data not Bound"
$K wait --for=condition=Ready pod/db --timeout=60s >/dev/null 2>&1 || fail "db not Running"
$K exec db -- cat /data/marker | grep -q hello || fail "volume not mounted"
ok "db has persistent storage"
