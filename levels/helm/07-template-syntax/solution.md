`templates/deployment.yaml` opens `{{- if .Values.resources }}` and never closes it.
    printf '          {{- end }}\n' >> web/templates/deployment.yaml
    helm install web ./web -n wg-helm
