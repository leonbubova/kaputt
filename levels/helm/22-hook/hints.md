## 1
Every template is applied together — unless it carries the annotation `helm.sh/hook`. A hook is applied at the point in the lifecycle the annotation names (`pre-install`, `post-upgrade`, …) and Helm waits for it to finish before going on; a Job with `restartPolicy: Never` is the usual shape. Hooks are not part of `helm get manifest`.
## 2
New file `templates/migrate-job.yaml`: `kind: Job`, `metadata.name: {{ .Release.Name }}-migrate`, `metadata.annotations: {"helm.sh/hook": pre-install}`, one busybox container with `command: ["sh", "-c", "echo running schema migrations"]`, `restartPolicy: Never`. Check with `helm template web ./web` — the Job renders too.
## 3
`helm install web ./web -n wg-helm`, then `kubectl get jobs -n wg-helm` and `helm get hooks web -n wg-helm`.
