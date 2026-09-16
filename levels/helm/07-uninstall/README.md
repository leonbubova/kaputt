# remove a release — helm uninstall
Lesson: a release is removed as one unit. `helm uninstall` deletes everything the chart created — Deployment,
Service, ConfigMap, pods — and forgets the release name. Nothing else in the namespace is touched:
    helm uninstall RELEASE-NAME -n wg-helm
Try it — two releases run in `wg-helm`, both made from the same chart:
    cd ~/.k8s-wargame/helm/07-uninstall
    helm list -n wg-helm
    kubectl get all -n wg-helm
Your task: the release named `old` is no longer needed. Remove it. Release `web` must keep running.
Afterwards `helm list -n wg-helm` shows only `web`, and `kubectl get pods -n wg-helm` shows only web's pod.
Work in ~/.k8s-wargame/helm/07-uninstall/ (cd there first).
Check yourself:  wg check      stuck?  wg hint
