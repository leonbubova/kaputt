## 1
`Chart.yaml` → `version:`; `values.yaml` → `environment:`. `helm template web ./web` renders locally without touching the cluster — grep for `env=`.
## 2
`helm upgrade web ./web -n wg-helm`, then `helm history web -n wg-helm` (chart column, status column).
## 3
`helm uninstall wg-legacy -n wg-helm` deletes the release and every object it created.
