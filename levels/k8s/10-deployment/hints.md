## 1
A Deployment is a controller: you declare a pod template plus a replica count, it keeps that many pods running and replaces any that die. Labels are the glue — the deployment's selector must match the labels on its template. Nobody types manifests from memory; let kubectl draft it: `kubectl create deployment web --image=nginx:1.27-alpine --replicas=2 --dry-run=client -o yaml > web.yaml`.
## 2
Open `web.yaml`. `metadata.labels`, `spec.selector.matchLabels` and `spec.template.metadata.labels` must agree — `create deployment` already sets `app: web` on all three. Unsure what a field means? `kubectl explain deployment.spec.template`.
## 3
`kubectl apply -f web.yaml`, then `kubectl get deploy web` until it shows `2/2`. `kubectl get pods --show-labels` proves the pod labels.
