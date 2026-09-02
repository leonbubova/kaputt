## 1
Read the error to the end: it names the template file and the line. `helm template web ./web` shows the same without touching the cluster.
## 2
"unexpected EOF" in a Go template = a block was opened and never closed. Look for `{{- if ... }}` / `{{- range ... }}` without a matching `{{- end }}`.
## 3
Add `{{- end }}` after the `resources` block in `templates/deployment.yaml`, then `helm install web ./web -n wg-helm`.
