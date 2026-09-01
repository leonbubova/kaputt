## 1
`kubectl get endpoints web` — note the port next to the IP. Is that the port the container listens on?
## 2
`port` is what clients call, `targetPort` is where the pod listens. `kubectl get svc web -o yaml`.
## 3
`kubectl patch svc web -p '{"spec":{"ports":[{"port":80,"targetPort":80}]}}'`
