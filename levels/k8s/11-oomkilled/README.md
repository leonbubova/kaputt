# a memory limit is a hard ceiling: cross it and the kernel kills the process
Lesson: the previous level was about requests, the scheduler's input. Limits are the other half: a cap enforced at runtime by the kernel's cgroups. CPU over the limit gets throttled. Memory over the limit gets no such mercy — the kernel's OOM killer terminates the process instantly, however healthy the app is.
Kubernetes records that verdict on the container: Last State `Terminated`, Reason `OOMKilled`, Exit Code 137 (128 + signal 9, SIGKILL). The app's logs stop mid-sentence, because it was never asked to shut down. Then the restart loop from level 08 begins.
The fix is never in the app's code from your seat: either the limit is below what the app legitimately needs, or the app leaks. Know which by comparing the limit with the app's real footprint.
    kubectl get pods                             RESTARTS climbing
    kubectl describe pod NAME                    Last State: Reason and Exit Code
    kubectl get deploy NAME -o jsonpath='{.spec.template.spec.containers[0].resources}'   the limits as stored
    kubectl set resources deploy/NAME --limits=memory=SIZE   change the cap
    kubectl logs deploy/NAME                     what the app printed before it was killed
Try it first: `kubectl top pod` (if metrics are available) — actual usage next to what you configured.
Your task: "`cache` starts, prints 'warming cache', dies. Repeat." The app legitimately needs ~60MB for its cache. Goal: cache runs stably.
Check yourself:  wg check      stuck?  wg hint
