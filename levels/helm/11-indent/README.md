# YAML parse error on install
"After moving the static files into `values.yaml`, `helm install web ./web -n wg-helm` fails with `error converting YAML to JSON`."
Chart copy: `~/.k8s-wargame/helm/11-indent/web`. Goal: release `web` deployed, ConfigMap `web-html` holds both files, page serves the index from the ConfigMap.
