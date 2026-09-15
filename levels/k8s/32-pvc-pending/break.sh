source ../../../lib/common.sh
$K apply -f - <<'Y'
apiVersion: v1
kind: PersistentVolumeClaim
metadata: {name: db-data}
spec:
  accessModes: [ReadWriteOnce]
  storageClassName: fast-ssd
  resources: {requests: {storage: 1Gi}}
---
apiVersion: v1
kind: Pod
metadata: {name: db}
spec:
  containers:
  - name: db
    image: busybox:1.36
    command: ["sh","-c","echo hello > /data/marker && sleep infinity"]
    volumeMounts: [{name: data, mountPath: /data}]
  volumes: [{name: data, persistentVolumeClaim: {claimName: db-data}}]
Y
