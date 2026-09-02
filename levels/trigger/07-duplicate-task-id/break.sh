source "$WG_ROOT/lib/common.sh"; source ../lib.sh
sed -i.bak 's#id: "process-refund"#id: "process-order"#' "$WG_APP/src/trigger/process-refund.ts" && rm -f "$WG_APP/src/trigger/process-refund.ts.bak"
