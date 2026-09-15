# ingress gives 404
"`curl -H 'Host: web.wg.local' http://localhost:8080/` returns 404 from Traefik. Service works internally." Goal: that curl returns the nginx welcome page.
