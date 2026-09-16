source ../../../lib/common.sh
$K apply -f - <<'Y'
apiVersion: v1
kind: ServiceAccount
metadata: {name: reporter}
---
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata: {name: pod-reader}
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get","list"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata: {name: reporter-reads-pods}
subjects:
- {kind: ServiceAccount, name: reporter, namespace: default}
roleRef: {kind: Role, name: pod-reader, apiGroup: rbac.authorization.k8s.io}
---
apiVersion: apps/v1
kind: Deployment
metadata: {name: reporter}
spec:
  replicas: 1
  selector: {matchLabels: {app: reporter}}
  template:
    metadata: {labels: {app: reporter}}
    spec:
      serviceAccountName: reporter
      containers:
      - name: kubectl
        image: bitnamilegacy/kubectl:1.31
        command: ["sh","-c","while true; do kubectl get pods -n $NS || exit 1; sleep 60; done"]
Y
