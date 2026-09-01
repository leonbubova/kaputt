targetPort 8080, nginx listens on 80.
    kubectl patch svc web -p '{"spec":{"ports":[{"port":80,"targetPort":80}]}}'
