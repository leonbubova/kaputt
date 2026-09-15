## 1
`nodeSelector` is a hard rule: the scheduler only considers nodes carrying exactly those labels. If none does, the pod isn't rejected — it just waits, Pending, until a node matches. `kubectl describe pod trainer` → "0/3 nodes are available: 3 node(s) didn't match Pod's node affinity/selector".
## 2
`kubectl get nodes --show-labels`. Which label does the pod want (`kubectl get pod trainer -o yaml | grep -A2 nodeSelector`)?
## 3
`kubectl label node <one agent node> disktype=ssd`. Scheduler retries Pending pods automatically.
