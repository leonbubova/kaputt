# install a chart — your first release
Lesson: `helm install` renders the chart like `helm template` did and then applies the YAML to the cluster.
The result is a *release*: the chart's objects (Deployment, Service, ConfigMap …) plus a name Helm remembers.
`-n` picks the namespace, exactly as with kubectl — in this track it is always `wg-helm`:
    helm install RELEASE-NAME CHART-FOLDER -n wg-helm
    helm list -n wg-helm             every release in the namespace, with its status
    helm status RELEASE-NAME -n wg-helm    one release in detail
Try it — look around first, nothing is installed yet:
    cd ~/.k8s-wargame/helm/03-install-it
    helm list -n wg-helm
    kubectl get pods -n wg-helm
Your task: install the chart `web` (in the work dir) as release `web` into namespace `wg-helm`. Afterwards
`helm list -n wg-helm` shows `web` with STATUS `deployed` and `kubectl get pods -n wg-helm` shows one running pod.
Made a mistake (wrong name)? `helm uninstall NAME -n wg-helm` removes a release; then install again.
Work in ~/.k8s-wargame/helm/03-install-it/ (cd there first).
Check yourself:  wg check      stuck?  wg hint
