## 1
`kubectl get deploy,svc -n wg-helm` — is there anything called `shop-cache` at all? `helm get manifest shop -n wg-helm | grep kind:`.
## 2
The cache is a subchart in `charts/cache`. `Chart.yaml` lists it with `condition: cache.enabled` — it only renders when that value is true. `helm get values shop -n wg-helm`: what did prod actually set?
## 3
Fix the key in `values-prod.yaml` (`cache:`), then `helm upgrade shop ./shop -n wg-helm -f values-prod.yaml`.
