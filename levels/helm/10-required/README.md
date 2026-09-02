# install fails with "execution error"
"`helm install shop ./shop -n wg-helm` aborts with `execution error at (shop/templates/configmap.yaml...)`. Prod settings live in `values-prod.yaml` next to the chart, the runbook lost the exact command."
Work dir: `~/.k8s-wargame/helm/10-required/`. Goal: release `shop` deployed with prod config: 2 replicas, page shows `env=prod domain=shop.example.com`.
