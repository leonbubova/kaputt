## 1
Hooks are ordinary objects: `kubectl get jobs,pods -n wg-helm`. The failed Job's pod is still there — `kubectl describe pod <migrate-pod>`, read the last event.
## 2
"exec: /bin/bash: no such file or directory" — busybox has no bash. Look at the `command:` in `templates/migrate-job.yaml`.
## 3
Use `/bin/sh`. A failed install leaves a `failed` release behind: `helm uninstall web -n wg-helm`, then `helm install web ./web -n wg-helm`.
