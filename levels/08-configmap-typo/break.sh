source ../../lib/common.sh
$K apply -f - <<'Y'
apiVersion: v1
kind: ConfigMap
metadata: {name: web-config}
data:
  default.conf: |
    server {
        lissen 80;
        location / { root /usr/share/nginx/html; index index.html; }
    }
---
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
        volumeMounts: [{name: cfg, mountPath: /etc/nginx/conf.d}]
      volumes: [{name: cfg, configMap: {name: web-config}}]
Y
