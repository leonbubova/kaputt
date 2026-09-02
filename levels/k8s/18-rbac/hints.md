## 1
A pod talks to the API as its ServiceAccount, and RBAC only grants what a RoleBinding ties to that exact subject — name *and* namespace. 403 means no binding covers the identity that asked. Logs show the exact message including *who* was denied: `system:serviceaccount:<ns>:<name>`.
## 2
Check the binding: `kubectl get rolebinding reporter-reads-pods -o yaml`. Which ServiceAccount does it bind — in which namespace?
## 3
Test without restarting anything: `kubectl auth can-i list pods -n wg --as=system:serviceaccount:wg:reporter`. Fix the subject namespace.
