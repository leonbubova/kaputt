## 1
`kubectl get pods` — the STATUS column has a name for this. `describe` the pod, events at the bottom.
## 2
ImagePullBackOff / ErrImagePull: the node cannot download the image. Read the exact image reference in the event — every character.
## 3
`kubectl set image deploy/web <container>=<correct image>`. Container name: `kubectl get deploy web -o jsonpath='{.spec.template.spec.containers[0].name}'`.
