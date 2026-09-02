## 1
The quickest way to get a single pod: `kubectl run NAME --image=IMAGE`. Your current namespace is already `wg` (`kubectl config view --minify | grep namespace`).
## 2
Watch it come up: `kubectl get pods -w`. If it stays `ContainerCreating`, `kubectl describe pod hello` shows why (usually the image pull).
## 3
`kubectl run hello --image=nginx:1.27-alpine` — then `kubectl get pod hello -o jsonpath='{.spec.containers[0].image}'` to confirm the exact image tag.
