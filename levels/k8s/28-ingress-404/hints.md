## 1
An Ingress is a routing table for the ingress controller: host/path → a Service name and port, looked up in the Ingress's own namespace. If no Service with that name exists there's nothing to forward to, and the controller answers 404 itself. `kubectl describe ingress web` — the Backends line shows the service and whether it resolved to endpoints (`<error: ...>` is a clue).
## 2
Compare backend service name with `kubectl get svc`.
## 3
`kubectl edit ingress web` → backend.service.name.
