source ../../../lib/common.sh; source ../lib.sh
stage_chart
helm install web "$WGH/05-change-and-upgrade/web" -n $NS --wait --timeout 90s >/dev/null
