## 1
`kubectl get pods` — what's the STATUS? Then ask the pod why: `kubectl describe pod <name>` and read the events at the bottom.
## 2
CrashLoopBackOff means the process exits. Read what it said before dying: `kubectl logs <pod>` (add `--previous` if the current container is too young).
## 3
The app wants an env var. Compare its name with what the deployment sets: `kubectl get deploy api -o yaml | grep -A4 env:`. Fix with `kubectl edit deploy api` or `kubectl set env deploy/api DB_HOST=...`.
