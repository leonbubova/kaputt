    printf 'environment: prod\ndomain: shop.example.com\nreplicas: 2\n' > values-prod.yaml
    helm install shop ./shop -n wg-helm -f values-prod.yaml
