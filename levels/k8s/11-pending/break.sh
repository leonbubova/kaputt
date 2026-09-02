source ../../../lib/common.sh
$K apply -f - <<'Y'
apiVersion: apps/v1
kind: Deployment
metadata: {name: worker}
spec:
  replicas: 1
  selector: {matchLabels: {app: worker}}
  template:
    metadata: {labels: {app: worker}}
    spec:
      containers:
      - name: worker
        image: busybox:1.36
        command: ["sleep","infinity"]
        resources:
          requests: {cpu: "64", memory: 256Gi}
          limits:   {cpu: "64", memory: 256Gi}
Y
