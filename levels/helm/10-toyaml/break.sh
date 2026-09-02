source ../../../lib/common.sh; source ../lib.sh
stage_chart
helm install web "$WGH/10-toyaml/web" -n $NS --wait --timeout 90s >/dev/null
