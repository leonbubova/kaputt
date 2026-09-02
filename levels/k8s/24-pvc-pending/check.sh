source ../../../lib/common.sh
$K wait --for=condition=Ready pod/db --timeout=${WG_FAST:+6}${WG_FAST:-60}s >/dev/null 2>&1 || fail "db not Running"
[ "$($K get pvc db-data -o jsonpath='{.status.phase}')" = Bound ] || fail "pvc db-data not Bound"
$K exec db -- cat /data/marker | grep -q hello || fail "volume not mounted"
ok "db has persistent storage"
