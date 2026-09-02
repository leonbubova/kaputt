# port is what clients dial, targetPort is where traffic lands on the pod
Lesson: a Service has two port numbers, and they may differ. `port` is the number on the Service IP that clients connect to. `targetPort` is the number on the pod that traffic is forwarded to. `port: 80, targetPort: 8080` gives a container on 8080 a clean 80 outside.
That freedom is also the failure mode. If `targetPort` names a port nothing in the container listens on, the packet reaches a real pod and the pod's kernel answers: connection refused. That is the opposite tell from the previous level — endpoints exist, and the connection is rejected instead of hanging.
Endpoints show IP and port; the container listens on some port; the two must match. What a container listens on is decided by the process inside, not by any Kubernetes field; `containerPort` in the pod spec is documentation, not configuration.
    kubectl get endpoints NAME                   pod IP and the port the service forwards to
    kubectl get svc NAME -o yaml                 port and targetPort as stored
    kubectl exec NAME -- netstat -tln            what the container really listens on
    kubectl patch svc NAME -p '{"spec":{"ports":[{"port":..,"targetPort":..}]}}'   change the ports
Try it first: `kubectl get endpoints web` — read the number after the colon.
Your task: "Endpoints look fine this time, but `curl web` says connection refused." Goal: `http://web.wg.svc/` answers 200.
Check yourself:  wg check      stuck?  wg hint
