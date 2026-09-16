    kubectl create secret generic db-credentials --from-literal=password=s3cret
    kubectl apply -f - <<'Y'
    apiVersion: v1
    kind: Pod
    metadata: {name: api}
    spec:
      containers:
      - {name: api, image: busybox:1.36, command: [sleep, "3600"], env: [{name: DB_PASSWORD, valueFrom: {secretKeyRef: {name: db-credentials, key: password}}}]}
    Y
