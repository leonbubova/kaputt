# the cache should only ship in prod
Ticket: "Chart `shop` bundles its cache as a subchart in `charts/cache`. Dev installs of `shop` must NOT get the cache; only when a value `cache.enabled` is `true` should it be rendered — default `false`, `values-prod.yaml` switches it on. Install release `shop` in `wg-helm` with the prod settings."
Work dir: `~/.k8s-wargame/helm/19-subchart-condition/`. Goal: `helm template shop ./shop` contains no `shop-cache`, with `-f values-prod.yaml` it does; release `shop` deployed, `shop` and `shop-cache` available.
