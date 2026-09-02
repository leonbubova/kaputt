source ../../../lib/common.sh; source ../lib.sh
stage_chart
kubectl create ns wg-helm-staging >/dev/null 2>&1 || true
helm install shop "$WGH/17-wrong-namespace/shop" -n wg-helm-staging --wait --timeout 90s >/dev/null
