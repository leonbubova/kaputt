`{{- toYaml ... | indent 2 }}` swallows the newline; first key ends up on the `data:` line.
    sed -i "" 's/| indent 2/| nindent 2/' web/templates/configmap.yaml && helm install web ./web -n wg-helm
