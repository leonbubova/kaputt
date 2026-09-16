## 1
An Ingress is a routing table read by the ingress controller (Traefik here, published on your host's port 8080): host + path → Service name + port, looked up in the Ingress's own namespace. It adds nothing of its own — the Service must already work. `kubectl explain ingress.spec.rules`.
## 2
kubectl drafts one: `kubectl create ingress web --rule="web.wg.local/*=web:80" --dry-run=client -o yaml`. `/*` becomes `path: /` with `pathType: Prefix`. `kubectl describe ingress web` shows the backend and whether it resolved to endpoints.
## 3
`kubectl create ingress web --rule="web.wg.local/*=web:80"`, wait a few seconds, then `curl -H 'Host: web.wg.local' http://localhost:8080/`.
