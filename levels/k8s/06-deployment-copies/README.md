# a Deployment keeps copies of a pod
Lesson: a plain pod that dies stays dead (lesson 4). For real work you want Kubernetes to keep a program running
no matter what — that is a Deployment: "I want N copies of this pod, always." Kubernetes makes the pods (with
generated names like `web-6d5f8-x2k9q`), watches them, and replaces any that disappear. N is the replica count.
    kubectl get deployments                          NAME, READY (running copies / wanted copies)
    kubectl scale deployment NAME --replicas=N       change how many copies you want
Try it — a Deployment `web` with 1 copy exists. Delete its pod and watch it come back with a new name:
    kubectl get deployments
    kubectl get pods
    kubectl delete pod PASTE-THE-WEB-POD-NAME-HERE
    kubectl get pods
Your task: tell `web` to keep 3 copies. Done when `kubectl get deployments` shows `web` as `3/3`.
Where: your normal terminal. `wg start` already pointed `kubectl` at the wargame cluster, and namespace `wg` is your default — no extra flags needed.
Check yourself:  wg check      stuck?  wg hint
