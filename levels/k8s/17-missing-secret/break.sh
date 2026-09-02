source ../../../lib/common.sh
$K create secret generic db-credential --from-literal=password=s3cret >/dev/null
$K apply -f - <<'Y'
apiVersion: apps/v1
kind: Deployment
metadata: {name: api}
spec:
  replicas: 1
  selector: {matchLabels: {app: api}}
  template:
    metadata: {labels: {app: api}}
    spec:
      containers:
      - name: api
        image: busybox:1.36
        command: ["sh","-c","echo connecting with password=$DB_PASSWORD; sleep infinity"]
        env:
        - name: DB_PASSWORD
          valueFrom: {secretKeyRef: {name: db-credentials, key: password}}
Y
