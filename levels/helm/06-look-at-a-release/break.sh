source ../../../lib/common.sh; source ../lib.sh
stage_chart
case $(( RANDOM % 3 )) in 0) env=staging ;; 1) env=qa ;; *) env=preview ;; esac
helm install web "$WGH/06-look-at-a-release/web" -n $NS --set environment="$env" >/dev/null
