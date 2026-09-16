## 1
Subcharts are declared under `dependencies:` in `Chart.yaml` (look at it). A dependency can carry a `condition:` — the path of a value in the parent chart; when that value is false or missing, the whole subchart is left out of the render, without any error.
## 2
Add `condition: cache.enabled` to the `cache` entry in `Chart.yaml`; add `cache:` / `  enabled: false` to `values.yaml`. Compare `helm template shop ./shop | grep shop-cache` with `helm template shop ./shop -f values-prod.yaml | grep shop-cache`.
## 3
`helm install shop ./shop -n wg-helm -f values-prod.yaml`
