# what is running? — list, status, get values
Lesson: someone else installed a release and you need to know what is live. Four read-only commands tell you:
    helm list -n wg-helm                  all releases: name, revision, status, chart
    helm status web -n wg-helm            one release: status, revision, when it was last changed
    helm get values web -n wg-helm        the values that were passed with --set (or a values file)
    helm history web -n wg-helm           every revision so far
Note: `helm get values` shows overrides only, never the defaults from values.yaml — that is why it is the
place to look when a release behaves differently from the chart.
Try it — release `web` in `wg-helm` was installed with an override you did not see:
    cd ~/.k8s-wargame/helm/06-look-at-a-release
    helm list -n wg-helm
    helm status web -n wg-helm
    helm get values web -n wg-helm
Your task: find out which `environment` release `web` really runs with and write that one word into the file
`answer.txt` in the work dir (`echo THE-WORD > answer.txt`). It is not `dev` — the chart's values.yaml was
overridden.
Work in ~/.k8s-wargame/helm/06-look-at-a-release/ (cd there first).
Check yourself:  wg check      stuck?  wg hint
