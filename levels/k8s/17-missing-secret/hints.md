## 1
A pod that references a Secret or ConfigMap by name can't start until the kubelet finds that exact object in the same namespace — CreateContainerConfigError means the container's config couldn't be assembled. `kubectl describe pod` — the Events say exactly which object is missing.
## 2
`kubectl get secrets` — compare names character by character with the `secretKeyRef` in the deployment.
## 3
Either rename the secret or fix the reference. Never put the password as plain `value:` in the deployment.
