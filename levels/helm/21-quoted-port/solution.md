`containerPort: {{ .Values.port | quote }}` renders `"80"` — a string.
    sed -i "" 's/{{ .Values.port | quote }}/{{ .Values.port }}/' web/templates/deployment.yaml && helm install web ./web -n wg-helm
