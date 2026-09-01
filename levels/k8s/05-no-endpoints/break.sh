source ../../../lib/common.sh
$K create deploy web --image=nginx:1.27-alpine --replicas=2 --port=80 >/dev/null
$K apply -f - <<'Y'
apiVersion: v1
kind: Service
metadata: {name: web}
spec:
  selector: {app: webb}
  ports: [{port: 80, targetPort: 80}]
Y
