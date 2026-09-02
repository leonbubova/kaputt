# helm owns the release: change it with upgrade, not kubectl
Lesson: once a release exists, Helm remembers what it applied and the values it used. If you edit the live objects with `kubectl`, Helm does not know — and the next `helm upgrade` re-renders the chart from its own values and overwrites your change.
So changes go through `helm upgrade`: same chart, same release name, new values. Every upgrade creates a new revision; `helm history` lists them and `helm get values` shows the overrides Helm currently knows for the release.
`--set` works on upgrade exactly like on install.
    helm get values <release> -n wg-helm              overrides helm knows (empty = pure defaults)
    helm upgrade <release> <chart> -n wg-helm --set k=v    re-render with a new value, new revision
    helm history <release> -n wg-helm                 the revisions so far
    kubectl get deploy -n wg-helm                     what actually runs
Try it first: `helm get values web -n wg-helm` — nothing is set, the release runs on chart defaults.
Your task: "Release `web` in `wg-helm` runs 1 replica. We need 2. Do it through Helm so the next `helm upgrade` doesn't silently scale it back."
Chart copy: `~/.k8s-wargame/helm/02-set-values/web`. Goal: `web` has 2 available replicas and `helm get values web -n wg-helm` shows `replicas: 2`.
Check yourself:  wg check      stuck?  wg hint
