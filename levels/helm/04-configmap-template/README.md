# the chart is missing a ConfigMap
Ticket: "Release `web` in `wg-helm` won't start: the Deployment loads its env from ConfigMap `web-config`, but the chart doesn't ship one. Add a template for it: ConfigMap `<release name>-config` with key `GREETING`, value taken from a new chart value `greeting` (default `hello from helm`). Then roll it out."
Chart copy: `~/.k8s-wargame/helm/04-configmap-template/web`. Goal: pod available, `kubectl exec deploy/web -- printenv GREETING` prints the value from `values.yaml`; the ConfigMap is part of the release.
