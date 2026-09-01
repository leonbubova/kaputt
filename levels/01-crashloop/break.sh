source ../../lib/common.sh
$K apply -f - <<'Y'
apiVersion: apps/v1
kind: Deployment
metadata: {name: api, labels: {app: api}}
spec:
  replicas: 1
  selector: {matchLabels: {app: api}}
  template:
    metadata: {labels: {app: api}}
    spec:
      containers:
      - name: api
        image: busybox:1.36
        command: ["sh","-c","[ -n \"$DB_HOST\" ] || { echo \"FATAL: DB_HOST is not set, refusing to start\"; exit 1; }; echo \"api listening, db=$DB_HOST\"; sleep infinity"]
        env:
        - {name: DB_HOTS, value: postgres.wg.svc}
        - {name: LOG_LEVEL, value: info}
Y
