source ../../lib/common.sh
$K create deploy web --image=nginx:1.27-alpine --port=80 >/dev/null
$K expose deploy web --port=80 >/dev/null
$K apply -f - <<'Y'
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata: {name: web}
spec:
  rules:
  - host: web.wg.local
    http:
      paths:
      - path: /
        pathType: Prefix
        backend: {service: {name: web-svc, port: {number: 80}}}
Y
