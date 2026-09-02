# ship 0.2.0, clean up the old one
Ticket: "Release `web` (chart 0.1.0) is running in `wg-helm`. Cut chart `0.2.0`: bump `version` in `Chart.yaml`, change the default `environment` to `staging`, preview the rendered YAML with `helm template`, then upgrade. `helm history web` must show revision 2 as `deployed` with `web-0.2.0`. While you're there: release `wg-legacy` in the same namespace is abandoned — remove it and everything it owns."
Chart copy: `~/.k8s-wargame/helm/05-upgrade-uninstall/web`. Goal: as described; keep the release history of `web`.
