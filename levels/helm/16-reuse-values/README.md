# site says localhost after scaling up
"Ops scaled `shop` to 3 replicas with `helm upgrade shop ./shop --set replicas=3`. Scaling worked — but since then the page shows `env=dev domain=localhost` instead of prod. Nobody touched `values-prod.yaml`."
Work dir: `~/.k8s-wargame/helm/16-reuse-values/`. Goal: 3 available replicas AND the page shows `env=prod domain=shop.example.com`.
