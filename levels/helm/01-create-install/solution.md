    cd ~/.k8s-wargame/helm/01-create-install && helm create hello
    helm install wg-hello ./hello -n wg-helm --set image.tag=1.27-alpine
