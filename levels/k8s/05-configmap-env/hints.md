## 1
`kubectl create configmap app-config --from-literal=GREETING=hello`. For the pod, draft YAML instead of typing it: `kubectl run greeter --image=busybox:1.36 --restart=Never --dry-run=client -o yaml -- sh -c 'echo $GREETING; sleep 3600' > greeter.yaml`.
## 2
In `greeter.yaml`, under the container, add
    envFrom:
    - configMapRef:
        name: app-config
`kubectl explain pod.spec.containers.envFrom` shows the shape.
## 3
`kubectl apply -f greeter.yaml`, then `kubectl logs greeter`. Wrong output? Delete the pod (`kubectl delete pod greeter`), fix the file, apply again — pod specs are mostly immutable.
