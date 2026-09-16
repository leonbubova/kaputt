# change a knob on the command line — --set
Lesson: `values.yaml` holds the chart's defaults. You do not have to edit the file to use other values:
`--set KEY=VALUE` on the install line wins over the file. A key that is nested in values.yaml is written with
a dot — in this chart `page:` has `title:` under it, so the key is `page.title`:
    helm install web ./web -n wg-helm --set page.title=Hello
    helm get values web -n wg-helm      shows only what you overrode
Try it — see the override before installing (no cluster needed):
    cd ~/.k8s-wargame/helm/04-set-a-value
    helm template web ./web --set page.title=Hello
    helm template web ./web --set replicas=3
Your task: install the chart `web` as release `web` into `wg-helm` with the page title set to `Hello` on the
command line — do not edit `values.yaml`. `helm get values web -n wg-helm` must show `title: Hello`.
Wrong value? `helm uninstall web -n wg-helm`, then install again.
Work in ~/.k8s-wargame/helm/04-set-a-value/ (cd there first).
Check yourself:  wg check      stuck?  wg hint
