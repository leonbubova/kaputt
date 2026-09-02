# a container cannot start until the node has pulled its image
Lesson: an image reference is `registry/name:tag`. Before anything runs, the kubelet on the chosen node asks the registry for exactly that string. If the registry has no such name or tag — or needs credentials the node does not have — there is nothing to start. The kubelet retries with a growing pause, and the pod reports `ErrImagePull` and then `ImagePullBackOff`.
Unlike the previous level, no process ever ran, so there are no logs. The evidence lives in the pod's Events: the exact reference the node tried and the registry's answer. Read that reference character by character; a one-letter difference is a different image.
The image is set in the Deployment's pod template, keyed by container name. `kubectl set image` changes it and rolls out new pods.
    kubectl get pods                             STATUS shows the pull failure
    kubectl describe pod NAME                    Events: the image reference and the error
    kubectl get deploy NAME -o jsonpath='{.spec.template.spec.containers[0].name}'   the container name
    kubectl set image deploy/NAME CONTAINER=IMAGE:TAG   change the image
    kubectl rollout status deploy/NAME           wait for the new pods
Try it first: `kubectl describe pod NAME | tail -15` on one of the failing pods — the Events block is the last thing printed.
Your task: "We bumped nginx to 1.27 yesterday, since then the `web` deployment shows 0/2." Goal: 2 ready replicas running nginx 1.27.
Check yourself:  wg check      stuck?  wg hint
