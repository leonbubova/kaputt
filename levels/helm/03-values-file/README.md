# prod config in a file
Ticket: "Install chart `shop` as release `shop` in `wg-helm` with prod settings: `environment: prod`, `domain: shop.example.com`, `replicas: 2`. Don't edit the chart's `values.yaml` and no long `--set` chains — put the settings in `values-prod.yaml` next to the chart so we can commit it."
Work dir: `~/.k8s-wargame/helm/03-values-file/`. Goal: `values-prod.yaml` exists, release `shop` deployed from it, 2 pods, page shows `env=prod domain=shop.example.com`.
