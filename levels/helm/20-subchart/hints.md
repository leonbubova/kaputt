## 1
A release is exactly what the chart rendered — if a template didn't render (a subchart switched off, a condition false), that component simply doesn't exist, with no error anywhere. So first check whether the cache is there at all: `kubectl get deploy,svc -n wg-helm` — anything called `shop-cache`? `helm get manifest shop -n wg-helm | grep kind:`.
## 2
The cache is a subchart in `charts/cache`. `Chart.yaml` lists it with `condition: cache.enabled` — it only renders when that value is true. `helm get values shop -n wg-helm`: what did prod actually set?
## 3
Fix the key in `values-prod.yaml` (`cache:`), then `helm upgrade shop ./shop -n wg-helm -f values-prod.yaml`.
