## 1
Installing = the same as rendering, but the YAML goes into the cluster and Helm remembers it under a release name. You need three things: the release name, the chart folder, the namespace.
## 2
Stand in `~/.k8s-wargame/helm/03-install-it`. The chart folder is `./web`, the release name is `web`, the namespace flag is `-n wg-helm`. Then `helm list -n wg-helm`.
## 3
    cd ~/.k8s-wargame/helm/03-install-it
    helm install web ./web -n wg-helm
