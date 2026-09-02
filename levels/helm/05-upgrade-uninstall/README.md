# chart version vs release revision; uninstall removes everything a release owns
Lesson: two numbers move independently. The chart `version` in `Chart.yaml` is yours — bump it when the chart changes, like a package version. The release revision is Helm's — it counts up on every `helm upgrade`, whatever changed. `helm history` shows both side by side: revision, chart name-version, status.
Upgrade, never delete-and-reinstall: an upgrade keeps the history so `helm rollback` still works. Preview with `helm template` first so the upgrade contains no surprises.
Cleanup is the mirror image: `helm uninstall` removes the release and every object it created — Deployments, Services, ConfigMaps — in one go.
    helm template <release> <chart> | grep <something>    check the rendered output locally
    helm upgrade <release> <chart> -n wg-helm             new revision from the changed chart
    helm history <release> -n wg-helm                     revision, chart version, status
    helm uninstall <release> -n wg-helm                   release and all its objects gone
Try it first: `helm history web -n wg-helm` — one revision, chart `web-0.1.0`.
Your task: "Release `web` (chart 0.1.0) is running in `wg-helm`. Cut chart `0.2.0`: bump `version` in `Chart.yaml`, change the default `environment` to `staging`, preview the rendered YAML with `helm template`, then upgrade. `helm history web` must show revision 2 as `deployed` with `web-0.2.0`. While you're there: release `wg-legacy` in the same namespace is abandoned — remove it and everything it owns."
Chart copy: `~/.k8s-wargame/helm/05-upgrade-uninstall/web`. Goal: as described; keep the release history of `web`.
Check yourself:  wg check      stuck?  wg hint
