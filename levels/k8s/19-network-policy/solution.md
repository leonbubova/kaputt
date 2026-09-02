Allow rule selects `role: front-end`, pods are `role: frontend`.
    kubectl patch netpol allow-frontend-to-backend --type=json -p='[{"op":"replace","path":"/spec/ingress/0/from/0/podSelector/matchLabels/role","value":"frontend"}]'
