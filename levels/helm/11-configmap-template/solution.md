    echo 'greeting: hello from helm' >> web/values.yaml
    printf 'apiVersion: v1\nkind: ConfigMap\nmetadata:\n  name: {{ .Release.Name }}-config\ndata:\n  GREETING: {{ .Values.greeting | quote }}\n' > web/templates/config.yaml
    helm upgrade web ./web -n wg-helm
