## 1
`helm template` only prints — nothing is deployed. The first word after it is the release name, the second is the chart folder. What it prints is plain Kubernetes YAML, holes already filled.
## 2
Stand in `~/.k8s-wargame/helm/02-render-it`, run `helm template demo ./web`, and put a `> rendered.yaml` at the end of the line so the output lands in the file instead of on the screen.
## 3
    cd ~/.k8s-wargame/helm/02-render-it
    helm template demo ./web > rendered.yaml
