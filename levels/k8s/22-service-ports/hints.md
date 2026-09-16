## 1
A Service has two ports that are easy to confuse: `port` is what clients dial on the Service's IP/name, `targetPort` is where the packets are delivered on the pod. They only have to match if you want them to. `kubectl explain service.spec.ports`.
## 2
`kubectl expose deployment web --port=8080` alone would forward 8080 → 8080, and nothing listens there in the pod. `kubectl get endpoints web` shows the pod port the service really targets.
## 3
`kubectl expose deployment web --port=8080 --target-port=80`, then test like the checker: `kubectl run tmp --rm -it --restart=Never --image=busybox:1.36 -- wget -qO- http://web.wg.svc:8080/`.
