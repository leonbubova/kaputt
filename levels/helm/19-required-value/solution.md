    sed -i "" 's/{{ .Values.domain }}/{{ required "domain is required" .Values.domain }}/' shop/templates/configmap.yaml
    helm install shop ./shop -n wg-helm -f values-prod.yaml
