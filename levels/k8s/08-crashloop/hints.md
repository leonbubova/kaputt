## 1
Kubernetes restarts a container whenever it exits; if it keeps exiting, the kubelet waits longer between attempts — that's CrashLoopBackOff. The cause is inside the process, not the cluster. `kubectl get pods` shows the STATUS; `kubectl describe pod <name>` lists the events at the bottom.
## 2
CrashLoopBackOff means the process exits. Read what it said before dying: `kubectl logs <pod>` (add `--previous` if the current container is too young).
## 3
The app wants an env var. Compare its name with what the deployment sets: `kubectl get deploy api -o yaml | grep -A4 env:`. Fix with `kubectl edit deploy api` or `kubectl set env deploy/api DB_HOST=...`.
