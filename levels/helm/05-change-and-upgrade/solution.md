Edit `environment: test` into web/values.yaml, then `helm upgrade` applies the changed chart as revision 2.
    cd ~/.k8s-wargame/helm/05-change-and-upgrade && helm upgrade web ./web -n wg-helm
