## 1
Before a container can start, the node's kubelet has to pull the image from a registry. If the registry says that name or tag doesn't exist, nothing runs and the kubelet retries with backoff — the pod's STATUS has a name for that. `kubectl get pods`, then `describe` the pod, events at the bottom.
## 2
ImagePullBackOff / ErrImagePull: the node cannot download the image. Read the exact image reference in the event — every character.
## 3
`kubectl set image deploy/web <container>=<correct image>`. Container name: `kubectl get deploy web -o jsonpath='{.spec.template.spec.containers[0].name}'`.
