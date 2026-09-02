source ../../../lib/common.sh; source ../lib.sh
stage_chart
helm install shop "$WGH/25-secret-in-values/shop" -n $NS --wait --timeout 90s >/dev/null
