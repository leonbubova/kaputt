## 1
Helm doesn't know which fields Kubernetes refuses to change after creation — it renders and applies, and the API server says no. So the question is which rendered field differs between the running revision and the new one. `helm history shop -n wg-helm` shows a failed revision. Diff the two: `helm get values shop -n wg-helm --revision 1` vs `-f values-prod.yaml`, and `helm template ... -f values-prod.yaml | grep -A3 matchLabels`.
## 2
A Deployment's `spec.selector` can never change once created. `values-prod.yaml` changes `tier`, which feeds the selector. Two ways out: don't change it, or recreate the Deployment.
## 3
Either drop `tier: frontend` from `values-prod.yaml` and upgrade — or `helm uninstall shop -n wg-helm && helm install shop ./shop -n wg-helm -f values-prod.yaml` (downtime!).
