# see the YAML before it runs — helm template
Lesson: a template is a Kubernetes YAML file with holes. A hole looks like `{{ .Values.replicas }}` — "put the
value `replicas` from values.yaml here". `{{ .Release.Name }}` is the name you will give this copy when you deploy
it (a deployed copy of a chart is called a *release*). Helm can fill the holes and print the finished YAML
without touching the cluster:
    helm template RELEASE-NAME CHART-FOLDER
Try it — a small chart `web` is in this lesson's work dir. Read a template, then render the whole chart:
    cd ~/.k8s-wargame/helm/02-render-it
    cat web/values.yaml
    cat web/templates/configmap.yaml
    helm template demo ./web
Compare: every `{{ .Release.Name }}` became `demo`, every `{{ .Values.… }}` became the line from values.yaml.
Your task: render the chart `web` with the release name `demo` and save the output into a file named
`rendered.yaml` in the work dir (`>` sends output into a file, as in the shell track).
Work in ~/.k8s-wargame/helm/02-render-it/ (cd there first).
Check yourself:  wg check      stuck?  wg hint
