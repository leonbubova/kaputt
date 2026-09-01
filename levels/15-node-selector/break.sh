source ../../lib/common.sh
kubectl label nodes --all disktype- >/dev/null 2>&1 || true
$K apply -f - <<'Y'
apiVersion: v1
kind: Pod
metadata: {name: trainer}
spec:
  nodeSelector: {disktype: ssd}
  containers:
  - {name: t, image: busybox:1.36, command: ["sleep","infinity"]}
Y
