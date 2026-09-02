# a Service gives pods a stable name by selecting their labels
Lesson: pods come and go, and each new one gets a new IP. Nothing should dial a pod IP. A Service is a stable name plus a virtual IP that stays put while the pods behind it change.
Which pods? A label selector decides, like the Deployment's. Every pod whose labels match becomes an endpoint; the cluster keeps that list current and load-balances across it. Inside the cluster the name resolves via DNS as `NAME.NAMESPACE.svc`.
`type: ClusterIP` is the default: reachable from inside the cluster only. `kubectl expose` builds a Service from an existing Deployment and copies its labels into the selector, so the wiring is right by construction.
    kubectl expose deployment NAME --port=80     a ClusterIP service in front of it
    kubectl get svc                              services, type and cluster IP
    kubectl get endpoints NAME                   the pod IPs the service currently selects
    kubectl get svc NAME -o yaml                 selector and ports as stored
    kubectl run tmp --rm -it --restart=Never --image=busybox:1.36 -- wget -qO- URL   fetch from inside the cluster
Try it first: `kubectl get pods --show-labels` — those labels are what a selector has to match.
Your task: ticket: "`web` is running in `wg` but nothing can reach it by name. We need a Service `web`, type ClusterIP, port 80, in front of the `web` pods." Goal: from inside the cluster, `http://web.wg.svc/` returns the nginx welcome page.
Check yourself:  wg check      stuck?  wg hint
