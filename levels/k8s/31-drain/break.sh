source ../../../lib/common.sh
kubectl uncordon k3d-wargame-agent-1 >/dev/null 2>&1 || true
$K create deploy web --image=nginx:1.27-alpine --replicas=3 --port=80 >/dev/null
$K apply -f - <<'Y'
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata: {name: web}
spec:
  minAvailable: 2
  selector: {matchLabels: {app: web}}
Y
$K rollout status deploy/web --timeout=90s >/dev/null
