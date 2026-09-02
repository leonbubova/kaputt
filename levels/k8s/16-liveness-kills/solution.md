Liveness probe hits /healthz → 404 → kubelet restarts the container.
    kubectl patch deploy web --type=json -p='[{"op":"replace","path":"/spec/template/spec/containers/0/livenessProbe/httpGet/path","value":"/"}]'
