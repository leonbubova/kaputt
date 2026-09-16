## 1
`kubectl get pods` is the short list, `kubectl describe pod NAME` is the long story of one pod. The task wants the long story of `demo`.
## 2
`kubectl describe pod demo > FILE` — the file is `~/.k8s-wargame/k8s/demo.txt`.
## 3
    kubectl describe pod demo > ~/.k8s-wargame/k8s/demo.txt
