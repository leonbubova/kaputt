Template uses `required` on `.Values.domain`; the chart defaults leave it empty, `values-prod.yaml` provides it.
    helm install shop ./shop -n wg-helm -f values-prod.yaml
