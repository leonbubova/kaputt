`helm template RELEASE CHART` prints the filled-in YAML; `>` writes it to the file.
    cd ~/.k8s-wargame/helm/02-render-it && helm template demo ./web > rendered.yaml
