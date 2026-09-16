# change the chart, roll it out — helm upgrade
Lesson: a release is not frozen. Change the chart (a template or `values.yaml`), then tell Helm to apply the
new version to the existing release:
    helm upgrade RELEASE-NAME CHART-FOLDER -n wg-helm
Every upgrade makes a new *revision* — a numbered version of the release. Helm keeps the list:
    helm history RELEASE-NAME -n wg-helm
Try it — release `web` is already installed from the chart in the work dir. Look at it:
    cd ~/.k8s-wargame/helm/05-change-and-upgrade
    helm history web -n wg-helm
    cat web/values.yaml
Your task: in `web/values.yaml` change the line `environment: dev` to `environment: test` (any editor; the
shell track showed how), then upgrade release `web` from the changed chart. `helm history web -n wg-helm` must
show revision 2 as `deployed`, and the page must say `env=test`.
Work in ~/.k8s-wargame/helm/05-change-and-upgrade/ (cd there first).
Check yourself:  wg check      stuck?  wg hint
