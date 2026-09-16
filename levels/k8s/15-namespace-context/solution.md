    kubectl create namespace team-a
    kubectl create deployment web --image=nginx:1.27-alpine -n team-a
    kubectl config set-context --current --namespace=team-a
