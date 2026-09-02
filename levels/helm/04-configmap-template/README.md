# every file in templates/ becomes an object; .Release and .Values fill the holes
Lesson: Helm renders each file under `templates/` and applies the result — add a file, the release gains an object. A template is ordinary Kubernetes YAML with `{{ ... }}` placeholders.
`{{ .Release.Name }}` is the release name (so one chart can be installed twice without clashes); `{{ .Values.foo }}` reads key `foo` from `values.yaml`. Give every new `.Values` key a default there so the chart renders without extra flags.
Quote values you paste into YAML: `| quote` wraps the text in double quotes so spaces or numbers cannot change the YAML's meaning.
    cat web/templates/configmap.yaml                  an existing template to copy the shape from
    {{ .Release.Name }}-config                        name derived from the release
    {{ .Values.greeting | quote }}                    a value, safely quoted
    helm template web ./web                           render locally and read the new object
    helm upgrade web ./web -n wg-helm                 roll the changed chart out
Your task: "Release `web` in `wg-helm` won't start: the Deployment loads its env from ConfigMap `web-config`, but the chart doesn't ship one. Add a template for it: ConfigMap `<release name>-config` with key `GREETING`, value taken from a new chart value `greeting` (default `hello from helm`). Then roll it out."
Chart copy: `~/.k8s-wargame/helm/04-configmap-template/web`. Goal: pod available, `kubectl exec deploy/web -- printenv GREETING` prints the value from `values.yaml`; the ConfigMap is part of the release.
Check yourself:  wg check      stuck?  wg hint
