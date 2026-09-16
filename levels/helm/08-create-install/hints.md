## 1
A chart is just a folder: `Chart.yaml` (metadata), `values.yaml` (the knobs), `templates/` (Kubernetes YAML with holes the values fill). `helm create hello` writes a complete starter chart (nginx) — look around; the image tag lives in `values.yaml` under `image.tag`.
## 2
Install = `helm install RELEASE CHART_DIR -n NAMESPACE`. Values can be overridden on the command line with `--set key.sub=value`. Check with `helm list -n wg-helm` and `kubectl get pods -n wg-helm`.
## 3
`helm install wg-hello ./hello -n wg-helm --set image.tag=1.27-alpine`
