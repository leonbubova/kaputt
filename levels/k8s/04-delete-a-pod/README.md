# delete a pod
Lesson: what you made, you can remove. A deleted pod stops, its container is thrown away, and its name is free
again. Kubernetes does not bring a plain pod back — gone is gone (that changes in lesson 6).
    kubectl delete pod NAME        stop and remove one pod
Try it — two pods are running, `keep` and `bye`:
    kubectl get pods
Your task: delete the pod `bye`. Leave `keep` alone. Afterwards `kubectl get pods` lists only `keep`
(for a few seconds `bye` may still show as Terminating — that is it shutting down).
Where: your normal terminal. `wg start` already pointed `kubectl` at the wargame cluster, and namespace `wg` is your default — no extra flags needed.
Check yourself:  wg check      stuck?  wg hint
