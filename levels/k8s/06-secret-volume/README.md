# a Secret mounted as a volume shows up as one file per key
Lesson: a Secret is a ConfigMap for sensitive data: same key/value shape, stored base64-encoded in the API, access controlled separately. Base64 is not encryption; the point is a separate object handled with care.
The other way in is a volume: the Secret is mounted at a directory, and every key becomes a file whose content is the value, in plain text. Apps that expect a key file on disk get exactly that.
A mount is always two parts: `spec.volumes` declares what the volume is (here: which Secret), and `containers[].volumeMounts` says where it appears in that container. They are linked by the volume's name. A busybox `sleep` keeps the pod alive so you can look inside.
    kubectl create secret generic NAME --from-literal=KEY=VALUE   the secret object
    kubectl get secret NAME -o yaml              base64 in the API
    kubectl explain pod.spec.volumes.secret      the volume side
    kubectl explain pod.spec.containers.volumeMounts   the container side
    kubectl exec NAME -- ls /path                run a command inside the pod
Try it first: `echo abc123 | base64` — what the API will store versus what the file will contain.
Your task: ticket: "The reader service loads its API key from a file, not from env. Create a Secret `api-key` in `wg` with key `token` = `abc123`, and a pod `reader` (image `busybox:1.36`, keep it running) that mounts the secret at `/etc/secret`." Goal: `kubectl exec reader -- cat /etc/secret/token` prints `abc123`.
Check yourself:  wg check      stuck?  wg hint
