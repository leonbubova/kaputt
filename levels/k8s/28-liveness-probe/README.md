# tell the kubelet when nginx is dead
Ticket: "If nginx in `web` ever hangs, nobody notices until customers call. Give the container of the `web` deployment in `wg` a liveness probe: HTTP GET `/` on port 80, every 5 seconds."
Goal: the `web` pod carries that probe, passes it, and stays up without restarts.
