    kubectl create deployment web --image=nginx:1.27-alpine --replicas=2 --dry-run=client -o yaml > web.yaml
    kubectl apply -f web.yaml
