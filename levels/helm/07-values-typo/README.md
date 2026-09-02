# deployed means accepted, not working: a missing value renders as nothing
Lesson: `deployed` only says the rendered YAML was accepted by the API server. Helm does not check that it makes sense, and Kubernetes accepts many objects it can never run. A green `helm status` next to a broken pod is no contradiction.
A common way there: the template reads `.Values.some.key` but no such key exists. Helm does not error — a missing value renders as an empty string, silently. Valid YAML, pod fails at runtime.
So look at what Helm actually produced: `helm get manifest` prints the YAML applied for the release, `helm template` renders your current chart copy. Then compare the template's `.Values` paths with the keys in `values.yaml`, letter by letter.
    helm get manifest web -n wg-helm | grep image:    what helm applied
    helm template web ./web | grep image:             what the chart renders now
    kubectl describe pod -n wg-helm -l app=web        why kubernetes refuses it
    helm upgrade web ./web -n wg-helm                 apply the corrected chart
Try it first: `kubectl get pods -n wg-helm` next to `helm status web -n wg-helm` — one is red, one is green.
Your task: "`helm install` went through fine, `helm status web` is green, but the pod never starts. Kubernetes is complaining about the image."
Chart copy: `~/.k8s-wargame/helm/07-values-typo/web`. Goal: pod of release `web` running `nginx:1.27-alpine`, page reachable. Fix it through Helm (`helm get manifest web -n wg-helm` must show the right image).
Check yourself:  wg check      stuck?  wg hint
