# pods: the things that run
Lesson: the cluster does not run programs directly — it runs Pods. A Pod is one running program in its box
(a container), with a name. When you ask Kubernetes to run something, you get a Pod. Two ways to look at them:
    kubectl get pods               one line per pod: NAME, READY, STATUS (Running = fine), how many RESTARTS, AGE
    kubectl describe pod NAME      everything about one pod: its Image (the program), its node, and at the bottom Events — what happened to it
Try it — two pods are already running in your namespace:
    kubectl get pods
    kubectl describe pod worker
Read the `Image:` line of `worker`, then scroll to `Events:` at the bottom.
Your task: save the description of the pod `demo` into the file `~/.k8s-wargame/k8s/demo.txt` — the same
`describe` command as above, with `demo` instead of `worker`, and `>` plus the file name behind it.
Where: your normal terminal. `wg start` already pointed `kubectl` at the wargame cluster, and namespace `wg` is your default — no extra flags needed.
Check yourself:  wg check      stuck?  wg hint
