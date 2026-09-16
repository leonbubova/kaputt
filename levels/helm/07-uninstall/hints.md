## 1
Uninstall takes a release name, not a chart folder and not a pod name. Everything that release created disappears together.
## 2
`helm list -n wg-helm` shows both names. The one to remove is `old`; the other one stays untouched.
## 3
    helm uninstall old -n wg-helm
