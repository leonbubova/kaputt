source ../../../lib/common.sh; source ../lib.sh
stage_chart
helm install web "$WGH/05-upgrade-uninstall/web" -n $NS --wait --timeout 90s >/dev/null
helm install wg-legacy "$WGH/05-upgrade-uninstall/web" -n $NS >/dev/null
