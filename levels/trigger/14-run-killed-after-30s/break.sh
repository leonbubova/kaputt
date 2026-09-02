source "$WG_ROOT/lib/common.sh"; source ../lib.sh
sed -i.bak 's#maxDuration: 1200#maxDuration: 30#' "$WG_APP/src/trigger/generate-report.ts" && rm -f "$WG_APP/src/trigger/generate-report.ts.bak"
