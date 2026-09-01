## 1
`kubectl describe pod` — the Events say exactly which object is missing.
## 2
`kubectl get secrets` — compare names character by character with the `secretKeyRef` in the deployment.
## 3
Either rename the secret or fix the reference. Never put the password as plain `value:` in the deployment.
