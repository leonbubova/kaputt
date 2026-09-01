source ../../lib/common.sh
$K apply -f - <<'Y'
apiVersion: v1
kind: Service
metadata: {name: web}
spec: {selector: {app: web}, ports: [{port: 80, targetPort: 80}]}
---
apiVersion: apps/v1
kind: Deployment
metadata: {name: web}
spec:
  replicas: 1
  selector: {matchLabels: {app: web}}
  template:
    metadata: {labels: {app: web}}
    spec:
      containers:
      - name: nginx
        image: nginx:1.27-alpine
        livenessProbe:
          httpGet: {path: /healthz, port: 80}
          initialDelaySeconds: 1
          periodSeconds: 2
          failureThreshold: 1
Y
