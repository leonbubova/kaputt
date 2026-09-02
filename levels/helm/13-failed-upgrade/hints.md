## 1
`helm history shop -n wg-helm` — which revision is `deployed`, which `failed`? `helm get values shop -n wg-helm` shows what the failed one tried.
## 2
Get healthy first: `helm rollback shop 1 -n wg-helm`. Then fix the tag in `values-launch.yaml` (`1.27-alpine`) and upgrade again.
## 3
Next time let helm undo it for you: `helm upgrade shop ./shop -n wg-helm -f values-launch.yaml --rollback-on-failure --wait` (Helm 3 called this `--atomic`).
