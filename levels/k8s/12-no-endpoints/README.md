# a Service with no endpoints selects no pods — compare selector and labels
Lesson: level 03 let `kubectl expose` copy the labels. When someone writes the Service by hand, the selector is just text, and text can be wrong. Kubernetes does not validate it: a Service selecting zero pods is valid, it just has an empty endpoint list.
Traffic to such a Service has nowhere to go. No pod is there to refuse the connection, so clients see a hang or a timeout, not an error. The pods themselves are healthy — that is the tell: `Running` pods plus a silent service points at the wiring between them.
The Endpoints object is the Service's live answer to "who do I point at". Check it first for any Service problem. Empty means the selector matched nothing; from there it is a diff between selector and labels.
    kubectl get endpoints NAME                   the pod IPs the service selects, or none
    kubectl get svc NAME -o yaml                 the selector as stored
    kubectl get pods --show-labels               the labels the selector must match
    kubectl edit svc NAME                        change the live object
    kubectl patch svc NAME -p '{"spec":{"selector":{...}}}'   change one field from the shell
Try it first: `kubectl get endpoints` — every service in the namespace next to its current targets.
Your task: "`web` pods are Running, but `curl web` from any pod in the cluster hangs." Goal: `http://web.wg.svc/` answers 200 from inside the cluster.
Check yourself:  wg check      stuck?  wg hint
