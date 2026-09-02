## 1
`envFrom` (level 5) pulls in every key of a map; `env[].valueFrom.secretKeyRef` pulls in one key of one Secret under a name of your choosing — the pod spec only holds the reference, the kubelet fills in the value at start. Create the secret first: `kubectl create secret generic db-credentials --from-literal=password=s3cret`.
## 2
Draft the pod: `kubectl run api --image=busybox:1.36 --restart=Never --dry-run=client -o yaml -- sleep 3600 > api.yaml`. The shape you need: `kubectl explain pod.spec.containers.env.valueFrom.secretKeyRef`.
## 3
Under the container in `api.yaml`:
    env:
    - name: DB_PASSWORD
      valueFrom:
        secretKeyRef:
          name: db-credentials
          key: password
Apply, then `kubectl exec api -- sh -c 'echo $DB_PASSWORD'`.
