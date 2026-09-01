## 1
Reproduce: `kubectl run t --rm -it --image=busybox:1.36 --labels=role=frontend -- wget -qO- -T3 http://backend.wg.svc/`.
## 2
`kubectl get netpol` and `describe` the allow rule. Which label does it expect on the *source* pod?
## 3
`kubectl edit netpol allow-frontend-to-backend` — the podSelector under `from` must match exactly `role=frontend`.
