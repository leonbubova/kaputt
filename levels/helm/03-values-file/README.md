# a values file overrides only the keys it contains; render before you install
Lesson: `--set` is fine for one value, but real configuration lives in a file you can commit and review. `helm install -f my.yaml` layers that file on top of the chart's `values.yaml`: keys you name are replaced, everything else keeps its default. Same structure, same key names as `values.yaml` — that file is the reference for what the chart understands.
One values file per environment (`values-prod.yaml`, `values-staging.yaml`) is the usual pattern; the chart itself stays untouched.
Before installing, render: `helm template` prints the final YAML locally without a cluster, so you can see whether your values landed where you expect.
    cat shop/values.yaml                              every knob and its default
    helm template <release> <chart> -f my.yaml        render locally with the file applied
    helm install <release> <chart> -n wg-helm -f my.yaml    install with the file
    helm get values <release> -n wg-helm              what helm recorded for the release
Try it first: `helm template shop ./shop | grep -A2 index.html` — the defaults, then compare after adding `-f`.
Your task: "Install chart `shop` as release `shop` in `wg-helm` with prod settings: `environment: prod`, `domain: shop.example.com`, `replicas: 2`. Don't edit the chart's `values.yaml` and no long `--set` chains — put the settings in `values-prod.yaml` next to the chart so we can commit it."
Work dir: `~/.k8s-wargame/helm/03-values-file/`. Goal: `values-prod.yaml` exists, release `shop` deployed from it, 2 pods, page shows `env=prod domain=shop.example.com`.
Check yourself:  wg check      stuck?  wg hint
