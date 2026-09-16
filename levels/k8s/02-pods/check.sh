source ../../../lib/common.sh
NOTES="$HOME/.k8s-wargame/k8s"
[ -f "$NOTES/demo.txt" ] || fail "no ~/.k8s-wargame/k8s/demo.txt yet"
grep -qE '^Name:[[:space:]]+demo$' "$NOTES/demo.txt" || fail "demo.txt is not the description of pod demo — it should start with 'Name: demo' (kubectl describe pod demo)"
grep -q 'nginx:1.27-alpine' "$NOTES/demo.txt" || fail "demo.txt has no Image: line — use kubectl describe, not kubectl get"
ok "demo.txt holds the description of pod demo"
