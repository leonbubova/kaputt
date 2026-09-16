source ../../../lib/common.sh; source ../lib.sh
stage_chart
helm install web "$WGH/11-configmap-template/web" -n $NS >/dev/null
