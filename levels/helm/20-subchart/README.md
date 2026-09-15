# prod shop stuck in Init, waiting for the cache
"Release `shop` was installed with `-f values-prod.yaml`, but the pod never leaves `Init:0/1`. Logs say the cache is unreachable. In prod the chart is supposed to bring its own cache."
Work dir: `~/.k8s-wargame/helm/20-subchart/`. Goal: `shop` and `shop-cache` both available, page reachable. Don't remove the init container — the app really needs the cache.
