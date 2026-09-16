## 1
Two steps: change the file, then apply the change. Editing values.yaml alone does nothing to the cluster — the release only changes when you run `helm upgrade`.
## 2
Open `~/.k8s-wargame/helm/05-change-and-upgrade/web/values.yaml`, make it say `environment: test`. Then, standing in the work dir: `helm upgrade web ./web -n wg-helm`. Check with `helm history web -n wg-helm`.
## 3
    cd ~/.k8s-wargame/helm/05-change-and-upgrade
    sed -i.bak 's/^environment: dev/environment: test/' web/values.yaml
    helm upgrade web ./web -n wg-helm
