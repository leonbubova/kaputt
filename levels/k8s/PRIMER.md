# k8s — the commands you'll actually use
Everything is "get → describe → logs → fix → check". Learn these ten and every level is reachable.

  kubectl get pods                         what's running, and its STATUS (Running / CrashLoopBackOff / Pending…)
  kubectl get all                          pods + deployments + services + replicasets at once
  kubectl describe pod <name>              WHY: the Events at the bottom explain most failures
  kubectl logs <pod>  (--previous)         what the app printed; --previous = the crashed container
  kubectl exec -it <pod> -- sh             a shell inside the container
  kubectl apply -f file.yaml               create/update from a manifest
  kubectl edit deploy <name>               edit the live object in your editor
  kubectl set image deploy/<n> c=img:tag   change the image
  kubectl set env deploy/<n> KEY=val       set an env var (KEY- removes it)
  kubectl rollout undo deploy/<name>       go back one version

Mental model: a Deployment keeps N identical Pods alive. A Service gives Pods a stable name by matching their labels. If a Service returns nothing, its selector matches no Pod — check `kubectl get endpoints <svc>`.
