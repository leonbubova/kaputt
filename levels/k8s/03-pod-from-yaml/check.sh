source ../../../lib/common.sh
$K get pod first >/dev/null 2>&1 || fail "no pod named first yet — write the 8 lines to ~/.k8s-wargame/k8s/first.yaml and run kubectl apply -f on it"
t=60; [ -n "${WG_FAST:-}" ] && t=6; i=0
until [ "$($K get pod first -o jsonpath='{.status.phase}' 2>/dev/null)" = Running ]; do sleep 2; i=$((i+2)); [ $i -ge $t ] && fail "pod first exists but is not Running yet — kubectl get pods, then kubectl describe pod first (Events at the bottom)"; done
img=$($K get pod first -o jsonpath='{.spec.containers[0].image}'); [ "$img" = nginx:1.27-alpine ] || fail "pod first runs image $img — the file must say image: nginx:1.27-alpine"
ok "pod first is Running — your first pod from a file"
