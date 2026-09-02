source ../../../lib/common.sh; source ../lib.sh
stage_chart
helm install shop "$WGH/23-name-in-use/shop" -n $NS >/dev/null
helm uninstall shop -n $NS --keep-history >/dev/null
