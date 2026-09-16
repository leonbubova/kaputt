## 1
Every container can declare `resources`: **requests** are what the scheduler reserves on a node for it (a node must have that much free or the pod stays Pending), **limits** are a hard ceiling the kernel enforces at runtime. See what a node has to give: `kubectl describe node <node>` → Allocatable.
## 2
They live per container in the pod template: `kubectl explain deploy.spec.template.spec.containers.resources`. Changing the template rolls the deployment — new pods come up with the numbers, `kubectl get pods -w` shows the swap.
## 3
`kubectl set resources deploy/web --requests=cpu=100m,memory=64Mi --limits=cpu=200m,memory=128Mi` — then `kubectl get deploy web -o jsonpath='{.spec.template.spec.containers[0].resources}'`.
