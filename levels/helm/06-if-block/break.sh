source ../../../lib/common.sh; source ../lib.sh
stage_chart
helm install web "$WGH/06-if-block/web" -n $NS --wait --timeout 90s >/dev/null
