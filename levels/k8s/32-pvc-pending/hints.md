## 1
A PVC is only a request; a StorageClass names the provisioner that actually creates the volume. Ask for a class nobody provides and the claim waits forever — Pending, and so does every pod that mounts it. `kubectl describe pvc db-data` → Events: no provisioner / storageclass not found.
## 2
`kubectl get storageclass`. Which one exists, which one is default?
## 3
storageClassName is immutable on a PVC: delete the PVC and recreate it with the existing class (or omit the field to get the default), then the pod.
