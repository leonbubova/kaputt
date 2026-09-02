source ../../../lib/common.sh
$K get deploy web >/dev/null 2>&1 || fail "deployment web is gone"
img=$($K get deploy web -o jsonpath='{.spec.template.spec.containers[0].image}'); [ "$img" = nginx:1.27-alpine ] || fail "image was changed ($img)"
[ "$($K get deploy web -o jsonpath='{.spec.replicas}')" = 2 ] || fail "web must keep 2 replicas"
base=$($K get deploy web -o jsonpath='{.metadata.annotations.wgbaseline}')
wait_available web 2 90 || fail "web does not have 2 available replicas"
t=60; [ -n "${WG_FAST:-}" ] && t=6; i=0
while :; do
  active=$($K get rs -l app=web -o jsonpath='{range .items[?(@.spec.replicas>0)]}{.metadata.name}{"\n"}{end}')
  n=$(printf '%s\n' "$active" | grep -c . || true)
  [ "$n" = 1 ] && [ "$active" != "$base" ] && break
  [ "$active" = "$base" ] && fail "the pods still belong to the original ReplicaSet — nothing was rolled"
  sleep 2; i=$((i+2)); [ $i -ge $t ] && fail "rollout not finished (active ReplicaSets: $(echo $active))"
done
ok "web rolled: all pods fresh, 2/2 available"
