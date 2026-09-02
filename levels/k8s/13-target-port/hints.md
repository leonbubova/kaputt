## 1
A Service has two ports: `port` is what clients dial on the Service IP, `targetPort` is where the traffic lands on the pod. If `targetPort` isn't what the container listens on, the pod answers with connection refused. `kubectl get endpoints web` — note the port next to the IP.
## 2
Compare `kubectl get svc web -o yaml` (`targetPort`) with what nginx actually listens on — the two must agree.
## 3
`kubectl patch svc web -p '{"spec":{"ports":[{"port":80,"targetPort":80}]}}'`
