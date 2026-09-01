## 1
`kubectl describe ingress web` — the Backends line shows the service and whether it resolved to endpoints (`<error: ...>` is a clue).
## 2
Compare backend service name with `kubectl get svc`.
## 3
`kubectl edit ingress web` → backend.service.name.
