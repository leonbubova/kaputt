    printf 'files:\n  index.html: "<h1>web</h1><p>hello from the configmap</p>"\n  robots.txt: "User-agent: *\\nDisallow: /admin\\n"\n' >> web/values.yaml
    # templates/configmap.yaml, under data:   {{- toYaml .Values.files | nindent 2 }}
    helm upgrade web ./web -n wg-helm
