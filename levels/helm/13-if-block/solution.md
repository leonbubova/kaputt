    echo 'debug: false' >> web/values.yaml
    # in web/templates/configmap.yaml, inside index.html:  {{- if .Values.debug }} / <p>debug=on</p> / {{- end }}
    helm upgrade web ./web -n wg-helm --set debug=true
