## 1
`kubectl scale` works — until the next `helm upgrade` re-applies the chart's `replicas: 1`. Helm needs to own the value. `helm get values web -n wg-helm` shows what helm currently knows (nothing yet).
## 2
Changing a live release = `helm upgrade RELEASE CHART`. Same `--set` as with install. Afterwards `helm history web -n wg-helm` shows revision 2.
## 3
`helm upgrade web ./web -n wg-helm --set replicas=2`
