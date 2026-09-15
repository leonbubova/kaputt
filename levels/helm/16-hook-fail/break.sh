source ../../../lib/common.sh; source ../lib.sh
stage_chart
helm install web "$WGH/16-hook-fail/web" -n $NS --timeout 60s >/dev/null 2>&1 || true
