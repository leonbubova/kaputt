## 1
A chart has its own `version` in `Chart.yaml`, separate from the release revisions helm counts on every upgrade — bump it to say "this is a new chart". `helm template web ./web` renders locally without touching the cluster, so check there first (grep for `env=`); the knobs are `Chart.yaml` → `version:` and `values.yaml` → `environment:`.
## 2
`helm upgrade web ./web -n wg-helm`, then `helm history web -n wg-helm` (chart column, status column).
## 3
`helm uninstall wg-legacy -n wg-helm` deletes the release and every object it created.
