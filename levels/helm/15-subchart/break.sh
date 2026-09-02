source ../../../lib/common.sh; source ../lib.sh
stage_chart values-prod.yaml
helm install shop "$WGH/15-subchart/shop" -n $NS -f values-prod.yaml >/dev/null
