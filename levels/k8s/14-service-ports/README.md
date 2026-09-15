# service on 8080, nginx on 80
Ticket: "The gateway team dials every internal service on port 8080. nginx in `web` listens on 80 and we are not rebuilding the image. Create Service `web` (ClusterIP) in `wg` so that `http://web.wg.svc:8080/` reaches the `web` pods."
Goal: the service listens on 8080, traffic lands on the container's port 80, the welcome page comes back.
