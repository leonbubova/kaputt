source ../../../lib/common.sh; source ../lib.sh
stage_chart
helm install web "$WGH/07-uninstall/web" -n $NS >/dev/null
helm install old "$WGH/07-uninstall/web" -n $NS --set page.title=old >/dev/null
