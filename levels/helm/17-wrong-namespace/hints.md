## 1
Releases are namespaced. `helm list -n wg-helm` only shows that namespace — `helm list -A` shows all.
## 2
You can't move a release between namespaces. Remove it where it is, install it where it belongs.
## 3
`helm uninstall shop -n <wrong-ns>`, then `helm install shop ./shop -n wg-helm`.
