## 1
A Service is a stable name + a label selector. `kubectl expose` builds one from an existing deployment: `kubectl expose deployment web --port=80`.
## 2
Check that it actually points at pods: `kubectl get endpoints web` should list two IPs. Empty? Compare `kubectl get svc web -o yaml` (selector) with `kubectl get pods --show-labels`.
## 3
Test it the way the check does: `kubectl run tmp --rm -it --restart=Never --image=busybox:1.36 -- wget -qO- http://web.wg.svc/`.
