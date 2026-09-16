source ../../../lib/common.sh
NOTES="$HOME/.k8s-wargame/k8s"
[ -f "$NOTES/nodes.txt" ] || fail "no ~/.k8s-wargame/k8s/nodes.txt yet — type the command from the task and press Enter"
grep -q 'k3d-wargame-server-0' "$NOTES/nodes.txt" || fail "nodes.txt does not contain the node list — it should be the output of: kubectl get nodes"
grep -q 'Ready' "$NOTES/nodes.txt" || fail "nodes.txt has no Ready node in it"
ok "nodes.txt holds the node list — you talked to the cluster"
