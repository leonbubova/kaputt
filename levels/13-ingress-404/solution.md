Ingress points to service `web-svc`, the service is `web`.
    kubectl patch ingress web --type=json -p='[{"op":"replace","path":"/spec/rules/0/http/paths/0/backend/service/name","value":"web"}]'
