source ../../../lib/common.sh
$K create deploy backend --image=nginx:1.27-alpine --port=80 >/dev/null
$K label deploy backend role=backend --overwrite >/dev/null
$K patch deploy backend -p '{"spec":{"template":{"metadata":{"labels":{"role":"backend"}}}}}' >/dev/null
$K expose deploy backend --port=80 >/dev/null
$K apply -f - <<'Y'
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata: {name: default-deny-ingress}
spec:
  podSelector: {}
  policyTypes: [Ingress]
---
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata: {name: allow-frontend-to-backend}
spec:
  podSelector: {matchLabels: {role: backend}}
  policyTypes: [Ingress]
  ingress:
  - from:
    - podSelector: {matchLabels: {role: front-end}}
    ports: [{port: 80}]
Y
