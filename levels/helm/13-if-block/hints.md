## 1
A template can leave whole lines out: everything between `{{- if .Values.xxx }}` and `{{- end }}` is only rendered when the value is truthy (`false`, `""`, `0` and missing count as off). `templates/deployment.yaml` already does this for `resources` — same pattern.
## 2
In `templates/configmap.yaml`, wrap a new `<p>debug=on</p>` line in `{{- if .Values.debug }}` … `{{- end }}`, add `debug: false` to `values.yaml`. Compare `helm template web ./web | grep debug` with `helm template web ./web --set debug=true | grep debug`.
## 3
`helm upgrade web ./web -n wg-helm --set debug=true`
