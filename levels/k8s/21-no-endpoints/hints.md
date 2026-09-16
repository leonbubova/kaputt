## 1
A Service is just a label selector. Who does it actually point at? `kubectl get endpoints web`.
## 2
Empty endpoints = selector matches no pod. Compare `kubectl get svc web -o yaml` (selector) with `kubectl get pods --show-labels`.
## 3
Fix the selector: `kubectl edit svc web` or `kubectl patch svc web -p '{"spec":{"selector":{"app":"web"}}}'`.
