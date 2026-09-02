source ../../../lib/common.sh; source ../lib.sh
stage_chart
helm install web "$WGH/04-configmap-template/web" -n $NS >/dev/null
