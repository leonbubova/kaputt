## 1
The number of copies is a setting on the Deployment, not on the pods. You do not create pods yourself — you change the wanted count and Kubernetes adds or removes pods to match.
## 2
`kubectl scale deployment web --replicas=3`, then `kubectl get deployments` until READY says 3/3.
## 3
    kubectl scale deployment web --replicas=3
