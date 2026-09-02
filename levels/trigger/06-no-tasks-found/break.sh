source "$WG_ROOT/lib/common.sh"; source ../lib.sh
sed -i.bak 's#dirs: \["./src/trigger"\]#dirs: ["./src/jobs"]#' "$WG_APP/trigger.config.ts" && rm -f "$WG_APP/trigger.config.ts.bak"
