# templates are text substitution: indent adds spaces, nindent adds a newline first
Lesson: Helm does not understand YAML while rendering — it pastes text. The result must then parse as YAML, where the column a line starts in *is* the structure. A multi-line value pasted at the wrong column is a parse error (`error converting YAML to JSON`).
Whitespace tools: `{{-` trims everything before the directive, newline included. `toYaml` turns a value into YAML text; `indent N` prefixes each line with N spaces but adds no leading newline; `nindent N` adds the newline first. `{{-` with `indent` pulls the first line up onto the previous one — the usual pattern is `{{- ... | nindent N }}`.
`helm template --debug` prints the rendered text even when it fails to parse, so you see where the lines landed.
    helm template web ./web --debug                  the rendered text, parse error and all
    {{- toYaml .Values.x | indent 2 }}               no newline: first line joins the line above
    {{- toYaml .Values.x | nindent 2 }}              newline, then 2 spaces per line
Try it first: `helm template web ./web --debug 2>&1 | grep -n -A3 'data:'` — look at what follows `data:` on the same line.
Your task: "After moving the static files into `values.yaml`, `helm install web ./web -n wg-helm` fails with `error converting YAML to JSON`."
Chart copy: `~/.k8s-wargame/helm/09-indent/web`. Goal: release `web` deployed, ConfigMap `web-html` holds both files, page serves the index from the ConfigMap.
Check yourself:  wg check      stuck?  wg hint
