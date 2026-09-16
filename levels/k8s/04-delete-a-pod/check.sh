source ../../../lib/common.sh
$K get pod keep >/dev/null 2>&1 || fail "pod keep is gone — only bye should be deleted (wg reset gives you both back)"
t=60; [ -n "${WG_FAST:-}" ] && t=6; i=0
while $K get pod bye >/dev/null 2>&1; do sleep 2; i=$((i+2)); [ $i -ge $t ] && fail "pod bye still exists — kubectl delete pod bye"; done
ok "bye is gone, keep is still there"
