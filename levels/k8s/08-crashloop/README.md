# CrashLoopBackOff means the process exits — the logs say why
Lesson: Kubernetes does not know what your app does; it only sees whether the container's main process is still running. If the process exits, the kubelet restarts it. If it keeps exiting, the kubelet waits longer between attempts — 10s, 20s, 40s, up to five minutes. That growing pause is the BackOff in `CrashLoopBackOff`.
So the status is not the problem, it is the cluster's reaction to it. The cause is inside the process: a missing setting, a bad config file, a dependency it cannot reach. The process usually says so on its way out, and Kubernetes keeps that output.
The order is always: status, Events, logs of the previous container. Environment variables are set on the Deployment's pod template, and changing them there rolls out new pods.
    kubectl get pods                             STATUS and RESTARTS
    kubectl describe pod NAME                    Last State, Exit Code, Events
    kubectl logs NAME --previous                 output of the container that crashed
    kubectl get deploy NAME -o yaml              the template as stored, env included
    kubectl set env deploy/NAME KEY=val          set an env var; KEY- removes one
Try it first: `kubectl get pods` twice, a minute apart — watch RESTARTS climb.
Your task: team says: "we deployed `api` to namespace `wg` 10 minutes ago and it's been flapping ever since." Goal: `api` deployment has 1 ready pod that stays up. Don't change the image.
Check yourself:  wg check      stuck?  wg hint
