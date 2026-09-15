source ../../../lib/common.sh; source ../lib.sh
stage_chart values-prod.yaml
helm install shop "$WGH/24-immutable/shop" -n $NS --wait --timeout 90s >/dev/null
helm upgrade shop "$WGH/24-immutable/shop" -n $NS -f values-prod.yaml >/dev/null 2>&1 || true
