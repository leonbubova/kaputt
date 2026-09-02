# put web on a hostname
Ticket: "`web` in `wg` works cluster-internally, now it has to be reachable from outside through the ingress controller. Create an Ingress `web` that routes host `web.wg.local`, path `/`, to Service `web` on port 80."
Goal: `curl -H 'Host: web.wg.local' http://localhost:8080/` returns the nginx welcome page.
