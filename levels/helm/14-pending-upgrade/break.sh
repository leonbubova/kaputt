source ../../../lib/common.sh; source ../lib.sh
stage_chart
# rev1: chart 0.1.0 with 1 replica
helm install shop ./hung -n $NS --wait --timeout 90s >/dev/null
# rev2: an upgrade whose pre-upgrade hook never finishes; kill helm mid-flight → pending-upgrade
helm upgrade shop ./hung -n $NS --timeout 30m >/dev/null 2>&1 &
hp=$!; i=0
while ! $K get job shop-preflight >/dev/null 2>&1; do sleep 1; i=$((i+1)); [ $i -gt 60 ] && { echo "hook job never appeared" >&2; kill -9 $hp; exit 1; }; done
sleep 2; kill -9 $hp 2>/dev/null; wait $hp 2>/dev/null || true
$K delete job shop-preflight --wait=false >/dev/null 2>&1 || true
