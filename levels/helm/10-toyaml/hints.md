## 1
`values.yaml` can hold a whole map, not just scalars. `toYaml` turns a value back into YAML text; because that text has several lines it must be pushed to the right column — `nindent N` prints a newline and then indents every line by N spaces.
## 2
`values.yaml`: `files:` with `index.html:` and `robots.txt:` (quoted strings, `\n` for line breaks). `templates/configmap.yaml`: replace the `data:` entries with `{{- toYaml .Values.files | nindent 2 }}` on the line after `data:`. Preview: `helm template web ./web | grep -A4 'data:'`.
## 3
`helm upgrade web ./web -n wg-helm`
