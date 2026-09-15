source ../../../lib/common.sh
$K apply -f - <<'Y'
apiVersion: apps/v1
kind: Deployment
metadata: {name: cache}
spec:
  replicas: 1
  selector: {matchLabels: {app: cache}}
  template:
    metadata: {labels: {app: cache}}
    spec:
      containers:
      - name: cache
        image: python:3.12-alpine
        command: ["python","-c","import time; print('warming cache',flush=True); x=bytearray(60*1024*1024); print('cache ready',flush=True); time.sleep(10**9)"]
        resources:
          limits: {memory: 32Mi}
Y
