source ../../../lib/common.sh
kubectl get ns team-a >/dev/null 2>&1 || fail "namespace team-a does not exist"
kubectl -n team-a get deploy web >/dev/null 2>&1 || fail "no deployment web in team-a"
t=60; [ -n "${WG_FAST:-}" ] && t=6; i=0
until [ "$(kubectl -n team-a get deploy web -o jsonpath='{.status.availableReplicas}' 2>/dev/null || echo 0)" -ge 1 ] 2>/dev/null; do sleep 2; i=$((i+2)); [ $i -ge $t ] && fail "web in team-a has no available replica"; done
ns=$(kubectl config view --minify -o jsonpath='{..namespace}'); [ "$ns" = team-a ] || fail "current context namespace is '$ns', want team-a"
ok "team-a has web, and it is your default namespace"
