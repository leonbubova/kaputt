## 1
A Secret is a ConfigMap for sensitive data. Mounted as a volume, every key becomes a file in the container — the app reads a path, not an env var. Base64 in the API (`kubectl get secret api-key -o yaml`), plain text once mounted. Create it: `kubectl create secret generic api-key --from-literal=token=abc123`.
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
