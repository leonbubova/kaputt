source "$WG_ROOT/lib/common.sh"; source ../lib.sh
sed -i.bak '/machine: "small-2x",/d' "$WG_APP/src/trigger/generate-report.ts" && rm -f "$WG_APP/src/trigger/generate-report.ts.bak"
