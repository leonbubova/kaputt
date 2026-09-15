Readiness probe on tcp 8080, nginx listens on 80.
    kubectl patch deploy web --type=json -p='[{"op":"replace","path":"/spec/template/spec/containers/0/readinessProbe/tcpSocket/port","value":80}]'
