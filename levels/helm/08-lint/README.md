# helm lint is a static check: Chart.yaml metadata and template rendering, no cluster
Lesson: `helm lint` runs the checks a chart must pass before anyone installs it: is `Chart.yaml` complete and well-formed, do the templates render, is the result valid YAML. It needs no cluster, so CI runs it on every commit as the first gate.
The output has three levels. `[INFO]` and `[WARNING]` are advice; any `[ERROR]` makes lint exit non-zero, and that non-zero exit is what fails a pipeline. Read the `[ERROR]` line — it says which file and what is wrong.
`Chart.yaml` has mandatory fields: `apiVersion` (v2 for Helm 3), `name`, and `version` in SemVer (`0.1.0`). A chart without one of them is not a chart, however fine its templates are.
    helm lint ./web                                   the check CI runs; exit code is the verdict
    echo $?                                           0 = green
    cat web/Chart.yaml                                apiVersion, name, version must all be there
    helm install web ./web -n wg-helm                 after lint is clean
Try it first: `helm lint ./web; echo exit=$?` — count the `[ERROR]` lines.
Your task: "The `helm lint` step in CI fails for chart `web` since the last Chart.yaml cleanup. Deploy is blocked."
Chart copy: `~/.k8s-wargame/helm/08-lint/web`. Goal: `helm lint web` exits 0 and release `web` is deployed in `wg-helm` with a reachable page.
Check yourself:  wg check      stuck?  wg hint
