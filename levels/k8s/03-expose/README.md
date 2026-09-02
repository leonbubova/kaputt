# expose it
Ticket: "`web` is running in `wg` but nothing can reach it by name. We need a Service `web`, type ClusterIP, port 80, in front of the `web` pods."
Goal: from inside the cluster, `http://web.wg.svc/` returns the nginx welcome page.
