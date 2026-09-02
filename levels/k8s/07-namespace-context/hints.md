## 1
`kubectl create namespace team-a`. Every namespaced command takes `-n team-a`: `kubectl create deployment web --image=nginx:1.27-alpine -n team-a`.
## 2
Your kubeconfig has contexts; each can carry a default namespace. See it: `kubectl config get-contexts` (NAMESPACE column) and `kubectl config view --minify`.
## 3
`kubectl config set-context --current --namespace=team-a`. Afterwards a plain `kubectl get deploy` lists `web` without `-n`.
