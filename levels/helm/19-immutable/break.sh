source ../../../lib/common.sh; source ../lib.sh
stage_chart values-prod.yaml
helm install shop "$WGH/19-immutable/shop" -n $NS --wait --timeout 90s >/dev/null
helm upgrade shop "$WGH/19-immutable/shop" -n $NS -f values-prod.yaml >/dev/null 2>&1 || true
