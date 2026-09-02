source ../../../lib/common.sh; source ../lib.sh
stage_chart
helm install web "$WGH/07-values-typo/web" -n $NS >/dev/null
