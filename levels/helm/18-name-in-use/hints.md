## 1
A release name is reserved by its release record (a Secret in the namespace), not by anything running — and a record can outlive every object it created. `helm list` hides some states. Try `helm list -n wg-helm --uninstalled`. `helm history shop -n wg-helm` also still answers.
## 2
`helm uninstall --keep-history` removes the objects but keeps the release record with status `uninstalled`. The name stays reserved.
## 3
Purge it: `helm uninstall shop -n wg-helm` (works on an `uninstalled` release), then `helm install shop ./shop -n wg-helm`. Shortcut: `helm install --replace`.
