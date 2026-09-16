    printf '    condition: cache.enabled\n' >> shop/Chart.yaml; printf 'cache:\n  enabled: false\n' >> shop/values.yaml
    helm install shop ./shop -n wg-helm -f values-prod.yaml
