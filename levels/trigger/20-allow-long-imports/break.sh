source "$WG_ROOT/lib/common.sh"; source ../lib.sh
sed -i.bak '/maxDuration: 600,/d' "$WG_APP/src/trigger/import-csv.ts" && rm -f "$WG_APP/src/trigger/import-csv.ts.bak"
