# required makes a missing value a loud error instead of a silent empty string
Lesson: earlier a missing value rendered as nothing and broke at runtime. Chart authors prevent that with `required`: `{{ required "message" .Values.x }}` renders the value if set and aborts rendering with the message if empty. The message is written by a human — it usually names the value to provide.
That is what `execution error at (chart/templates/file.yaml:LINE)` means: not a syntax problem, a deliberate check that fired. Read past the location to the message.
The fix is on the caller's side: provide the value via `--set` or a values file. `values.yaml` often leaves such keys empty on purpose so nobody installs prod with a placeholder.
    helm template shop ./shop                         render locally; read the whole message
    grep -rn required shop/templates                  which values the chart insists on
    helm template shop ./shop -f FILE                 does it render with the file?
    helm install shop ./shop -n wg-helm -f FILE       install with the values that satisfy it
Your task: "`helm install shop ./shop -n wg-helm` aborts with `execution error at (shop/templates/configmap.yaml...)`. Prod settings live in `values-prod.yaml` next to the chart, the runbook lost the exact command."
Work dir: `~/.k8s-wargame/helm/10-required/`. Goal: release `shop` deployed with prod config: 2 replicas, page shows `env=prod domain=shop.example.com`.
Check yourself:  wg check      stuck?  wg hint
