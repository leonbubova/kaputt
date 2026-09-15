source ../../../lib/common.sh; source ../lib.sh
stage_chart values-prod.yaml
helm install shop "$WGH/21-reuse-values/shop" -n $NS -f values-prod.yaml --wait --timeout 90s >/dev/null
helm upgrade shop "$WGH/21-reuse-values/shop" -n $NS --set replicas=3 --wait --timeout 90s >/dev/null
