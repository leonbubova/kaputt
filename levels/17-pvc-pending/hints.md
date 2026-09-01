## 1
`kubectl describe pvc db-data` → Events: no provisioner / storageclass not found.
## 2
`kubectl get storageclass`. Which one exists, which one is default?
## 3
storageClassName is immutable on a PVC: delete the PVC and recreate it with the existing class (or omit the field to get the default), then the pod.
