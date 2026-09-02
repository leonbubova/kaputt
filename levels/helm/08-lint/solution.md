`Chart.yaml` lost its `version:` field — mandatory.
    echo 'version: 0.1.0' >> web/Chart.yaml && helm lint web && helm install web ./web -n wg-helm
