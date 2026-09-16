source ../../../lib/common.sh
t=60; [ -n "${WG_FAST:-}" ] && t=6; i=0
until [ "$($K get pod hello -o jsonpath='{.status.phase}' 2>/dev/null)" = Running ]; do sleep 2; i=$((i+2)); [ $i -ge $t ] && fail "pod hello is not Running"; done
img=$($K get pod hello -o jsonpath='{.spec.containers[0].image}'); [ "$img" = nginx:1.27-alpine ] || fail "wrong image ($img)"
ok "hello is running nginx:1.27-alpine"
