# a chart is a folder
Lesson: in the k8s track you wrote Kubernetes YAML by hand. Helm packages such YAML into a *chart*: a folder
with a fixed layout. `Chart.yaml` = name and version, `values.yaml` = the knobs (image, replicas …), `templates/` =
the YAML files, with holes that the knobs fill in. One command writes a complete starter chart for you:
    helm create NAME
It makes a folder NAME with everything inside — an nginx you could deploy right away.
Try it — go to this lesson's work dir and look at a chart:
    cd ~/.k8s-wargame/helm/01-what-is-a-chart
    helm create demo
    ls demo
    cat demo/Chart.yaml
    cat demo/values.yaml
    ls demo/templates
Your task: create a second chart named exactly `hello` in the same work dir (next to `demo`), so that
`~/.k8s-wargame/helm/01-what-is-a-chart/hello/Chart.yaml` exists and says `name: hello`.
Work in ~/.k8s-wargame/helm/01-what-is-a-chart/ (cd there first).
Check yourself:  wg check      stuck?  wg hint
