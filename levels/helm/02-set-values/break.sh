source ../../../lib/common.sh; source ../lib.sh
stage_chart
helm install web "$WGH/02-set-values/web" -n $NS --wait --timeout 90s >/dev/null
