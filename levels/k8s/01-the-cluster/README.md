# a cluster, and how to talk to it
Lesson: Kubernetes runs programs on a group of computers. The group is called a cluster, each computer in it
a node. You never log into the nodes. You talk to the whole cluster with one command, `kubectl` ("cube-control"),
and it does the work for you. Everything you create lives in a namespace — a folder inside the cluster that
keeps one team's things apart from another's. Yours is called `wg` and is already your default.
Try it — `get` means "list the things of this kind":
    kubectl get nodes
    kubectl get namespaces
Three nodes, each `Ready`. Among the namespaces you see `wg`. That is the whole cluster you will play on.
Your task: put the node list into a file. Type this exactly (the `>` from the shell track):
    kubectl get nodes > ~/.k8s-wargame/k8s/nodes.txt
Where: your normal terminal. `wg start` already pointed `kubectl` at the wargame cluster, and namespace `wg` is your default — no extra flags needed.
Check yourself:  wg check      stuck?  wg hint
