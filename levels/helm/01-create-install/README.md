# a chart is a folder of templates plus values; install turns it into a release
Lesson: a Helm chart is nothing magical — a directory with `Chart.yaml` (name, version), `values.yaml` (the knobs) and `templates/` (Kubernetes YAML with holes that the values fill). `helm create` writes a complete working starter chart so you never begin from an empty file.
Installing a chart creates a release: a named, tracked instance of that chart in one namespace. The same chart can be installed many times under different release names.
Any value in `values.yaml` can be overridden on the command line with `--set key.sub=value` — the file keeps its defaults, the release gets your override.
    helm create hello                                    scaffold a chart into ./hello
    cat hello/values.yaml                                the knobs — look for image.tag
    helm install <release> ./hello -n wg-helm            create a release from the chart
    helm install ... --set image.tag=X                   override one value for this release
    helm list -n wg-helm                                 releases in the namespace
Try it first: `helm create hello` in a scratch dir and `ls hello hello/templates` — that is the whole chart.
Your task: "We're moving to Helm. Scaffold a chart called `hello` in `~/.k8s-wargame/helm/01-create-install/` and install it as release `wg-hello` into namespace `wg-helm`. The scaffold defaults to an nginx tag we don't mirror — run it with image tag `1.27-alpine`."
Goal: release `wg-hello` is `deployed`, its Deployment has 1 available pod running `nginx:1.27-alpine`.
Check yourself:  wg check      stuck?  wg hint
