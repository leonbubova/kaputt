    kubectl scale deployment web --replicas=4
    kubectl create configmap notes --from-literal=podcount=4
