## 1
Logs show the exact 403 message including *who* was denied: `system:serviceaccount:<ns>:<name>`.
## 2
Check the binding: `kubectl get rolebinding reporter-reads-pods -o yaml`. Which ServiceAccount does it bind — in which namespace?
## 3
Test without restarting anything: `kubectl auth can-i list pods -n wg --as=system:serviceaccount:wg:reporter`. Fix the subject namespace.
