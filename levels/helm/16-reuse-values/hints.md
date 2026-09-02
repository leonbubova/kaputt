## 1
`helm get values shop -n wg-helm` vs `helm get values shop -n wg-helm --revision 1`. What got lost between the two?
## 2
`helm upgrade` does NOT carry over previous `-f`/`--set` values by default — it starts from the chart defaults plus what you pass now. Either pass everything again, or use `--reuse-values`.
## 3
`helm upgrade shop ./shop -n wg-helm -f values-prod.yaml --set replicas=3` (or `--reuse-values -f values-prod.yaml`, which keeps `replicas=3` from revision 2).
