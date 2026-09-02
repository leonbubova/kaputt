## 1
`kubectl create secret generic api-key --from-literal=token=abc123`. Secrets are base64 in the API (`kubectl get secret api-key -o yaml`), plain files once mounted.
## 2
Draft the pod: `kubectl run reader --image=busybox:1.36 --restart=Never --dry-run=client -o yaml -- sleep 3600 > reader.yaml`. A mount needs two parts — `spec.volumes` (what) and `containers[].volumeMounts` (where). `kubectl explain pod.spec.volumes.secret`.
## 3
    volumes:
    - name: key
      secret:
        secretName: api-key
    containers:
    - ...
      volumeMounts:
      - name: key
        mountPath: /etc/secret
Apply, then `kubectl exec reader -- ls /etc/secret` — one file per secret key.
