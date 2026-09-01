## 1
Two steps: stop new pods landing there (`cordon`), then evict what's there (`drain`).
## 2
`kubectl drain k3d-wargame-agent-1 --ignore-daemonsets`. If it hangs, read the message: a PodDisruptionBudget limits how many web pods may be down at once. That's fine — it waits, it doesn't fail.
## 3
Verify: `kubectl get pods -o wide` (nothing on agent-1), `kubectl get nodes` (SchedulingDisabled).
