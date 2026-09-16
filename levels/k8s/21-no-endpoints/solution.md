Selector `app: webb`, pods have `app: web`.
    kubectl patch svc web -p '{"spec":{"selector":{"app":"web"}}}'
