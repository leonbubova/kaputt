# change desired state and the controller catches up; a ConfigMap is plain key/value data
Lesson: Kubernetes works on desired state. You do not start two more pods — you tell the Deployment its replica count is now 4, and the controller sees the gap between 2 running and 4 wanted and closes it. Scaling down works the same way. `kubectl scale` edits exactly that one field.
The ticket's second half introduces the ConfigMap: the cluster's store for non-secret configuration, a named object holding string keys and values. Nothing reads it yet — it just exists in the API like any other object, ready to be queried or, later, injected into pods.
Both are imperative kubectl verbs: quick, one field, no file. Fine for operations; anything you want to keep belongs in the manifest from level 02.
    kubectl scale deployment NAME --replicas=N   set the desired count
    kubectl get deploy NAME                      READY shows available/desired catching up
    kubectl create configmap NAME --from-literal=KEY=VALUE   a key/value object
    kubectl get cm NAME -o yaml                  the stored data
    kubectl get cm NAME -o jsonpath='{.data.KEY}'   one value, nothing else
Try it first: `kubectl get deploy web -o jsonpath='{.spec.replicas}'` — the single number you are about to change.
Your task: ticket: "Traffic doubled. Scale `web` in `wg` to 4 replicas. Then record the new count for the ops wiki: create a ConfigMap `notes` with the key `podcount` set to `4`." Goal: `web` has 4 available replicas, ConfigMap `notes` has `podcount=4`.
Check yourself:  wg check      stuck?  wg hint
