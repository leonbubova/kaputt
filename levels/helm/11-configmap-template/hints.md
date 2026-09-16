## 1
Every file in `templates/` is rendered and applied. Look at `templates/configmap.yaml` for how a ConfigMap template looks and how `{{ .Release.Name }}` / `{{ .Values.xxx }}` are used.
## 2
New file `templates/config.yaml`: `kind: ConfigMap`, `metadata.name: {{ .Release.Name }}-config`, `data: {GREETING: {{ .Values.greeting | quote }}}`. Add `greeting: hello from helm` to `values.yaml`. Check with `helm template web ./web`.
## 3
`helm upgrade web ./web -n wg-helm` — the pod restarts once the ConfigMap exists.
