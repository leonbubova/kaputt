## 1
A ConfigMap keeps config out of the image; the pod pulls it in at start, and `envFrom` turns every key into an environment variable — same image, different settings. Create the map (`kubectl create configmap app-config --from-literal=GREETING=hello`), then draft the pod YAML instead of typing it: `kubectl run greeter --image=busybox:1.36 --restart=Never --dry-run=client -o yaml -- sh -c 'echo $GREETING; sleep 3600' > greeter.yaml`.
## 2
In `greeter.yaml`, under the container, add
    envFrom:
    - configMapRef:
        name: app-config
`kubectl explain pod.spec.containers.envFrom` shows the shape.
## 3
`kubectl apply -f greeter.yaml`, then `kubectl logs greeter`. Wrong output? Delete the pod (`kubectl delete pod greeter`), fix the file, apply again — pod specs are mostly immutable.
