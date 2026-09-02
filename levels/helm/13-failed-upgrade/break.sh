source ../../../lib/common.sh; source ../lib.sh
stage_chart values-launch.yaml
helm install shop "$WGH/13-failed-upgrade/shop" -n $NS --wait --timeout 90s >/dev/null
helm upgrade shop "$WGH/13-failed-upgrade/shop" -n $NS -f "$WGH/13-failed-upgrade/values-launch.yaml" --wait --timeout 20s >/dev/null 2>&1 || true
