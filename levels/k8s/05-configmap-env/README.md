# envFrom turns a ConfigMap's keys into a container's environment variables
Lesson: the image should be the same in dev and prod; only the settings differ. Kubernetes separates the two: config lives in a ConfigMap, and the pod spec says how to pull it in at start. Change the map, restart the pod, same image behaves differently.
The simplest wiring is `envFrom` on a container: every key in the ConfigMap becomes an environment variable of that name. (`env[].valueFrom.configMapKeyRef` would pick single keys.)
A pod's spec is mostly immutable once created. Fix the file, delete the pod, apply again — that loop is normal. `kubectl run --dry-run=client -o yaml` drafts a pod manifest; `--restart=Never` makes a bare Pod, and anything after `--` becomes the container's command.
    kubectl create configmap NAME --from-literal=KEY=VALUE   the config object
    kubectl run NAME --image=IMG --restart=Never --dry-run=client -o yaml -- CMD > f.yaml   draft a pod
    kubectl explain pod.spec.containers.envFrom   the shape of the field
    kubectl apply -f f.yaml                      create the pod
    kubectl logs NAME                            what the container printed
Try it first: `kubectl explain pod.spec.containers.envFrom.configMapRef` — two fields, one of them optional.
Your task: ticket: "We want app config outside the image. Create a ConfigMap `app-config` in `wg` with `GREETING=hello`, then a pod `greeter` (image `busybox:1.36`) that gets **all** keys of that ConfigMap as environment variables and prints `$GREETING`." Goal: `kubectl logs greeter` contains `hello`, and the pod takes its env from `app-config` via `envFrom`.
Check yourself:  wg check      stuck?  wg hint
