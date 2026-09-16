## 1
Namespaces split one cluster into separate rooms: every namespaced object lives in exactly one, and kubectl looks in the namespace of your current context unless `-n` says otherwise. `kubectl create namespace team-a`, then `kubectl create deployment web --image=nginx:1.27-alpine -n team-a`.
## 2
Your kubeconfig has contexts; each can carry a default namespace. See it: `kubectl config get-contexts` (NAMESPACE column) and `kubectl config view --minify`.
## 3
`kubectl config set-context --current --namespace=team-a`. Afterwards a plain `kubectl get deploy` lists `web` without `-n`.
