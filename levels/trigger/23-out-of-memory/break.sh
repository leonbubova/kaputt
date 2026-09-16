source "$WG_ROOT/lib/common.sh"; source ../lib.sh
sed -i.bak '/machine: "medium-1x",/d' "$WG_APP/src/trigger/resize-images.ts" && rm -f "$WG_APP/src/trigger/resize-images.ts.bak"
