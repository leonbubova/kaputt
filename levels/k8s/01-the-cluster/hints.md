## 1
`kubectl get KIND` lists everything of one kind. `kubectl get nodes` lists the computers of the cluster. It prints to the screen; `>` sends it into a file instead.
## 2
The file must be exactly `~/.k8s-wargame/k8s/nodes.txt` — same command as in "Try it", plus `> ` and that path.
## 3
    kubectl get nodes > ~/.k8s-wargame/k8s/nodes.txt
