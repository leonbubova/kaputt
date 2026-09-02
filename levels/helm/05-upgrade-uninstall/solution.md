    sed -i "" 's/^version: 0.1.0/version: 0.2.0/' web/Chart.yaml; sed -i "" 's/^environment: dev/environment: staging/' web/values.yaml
    helm template web ./web | grep env=
    helm upgrade web ./web -n wg-helm && helm history web -n wg-helm
    helm uninstall wg-legacy -n wg-helm
