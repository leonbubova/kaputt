## 1
`shop/values.yaml` lists every value the chart understands with its default. A values file you pass overrides only the keys it contains — same structure, same names.
## 2
Preview before installing: `helm template shop ./shop -f values-prod.yaml | grep -A2 index.html`.
## 3
`helm install shop ./shop -n wg-helm -f values-prod.yaml`
