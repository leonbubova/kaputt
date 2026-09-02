# templates render locally first: a parse error stops before the cluster is touched
Lesson: `helm install` has two phases. First it renders the templates into plain YAML on your machine; only then does it send that YAML to the API server. A broken template fails in phase one — no objects, no pods, the cluster never saw anything. That is why the error names a file and a line inside `templates/`, not a Kubernetes resource.
Templates use Go template syntax: `{{ if ... }}`, `{{ range ... }}` and `{{ with ... }}` open a block, and each block must be closed with `{{ end }}`. An unclosed block is the classic cause of `unexpected EOF`.
Because rendering is local, `helm template` reproduces the exact error without a cluster — iterate there, then install.
    helm template web ./web                           render only; same error, no cluster
    {{- if .Values.x }} ... {{- end }}                every opener needs its end
    grep -n '{{' web/templates/*.yaml                 list all template directives with line numbers
    helm install web ./web -n wg-helm                 once it renders
Try it first: `helm template web ./web 2>&1 | tail -3` — read the file name and line in the error.
Your task: "CI runs `helm install web ./web -n wg-helm` and dies with a parse error nobody understands. Nothing gets created."
Your copy of the chart: `~/.k8s-wargame/helm/06-template-syntax/web`. Goal: release `web` is `deployed` in `wg-helm`, pod ready, page at `http://web.wg-helm.svc/`. Keep the memory limit.
Check yourself:  wg check      stuck?  wg hint
