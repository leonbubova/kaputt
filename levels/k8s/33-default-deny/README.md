# lock the namespace down
Ticket: "Security wants `wg` closed by default: no pod in the namespace may receive traffic unless a policy explicitly allows it. Create a NetworkPolicy `default-deny-ingress` that selects every pod in `wg` and allows no incoming traffic at all."
Goal: `http://backend.wg.svc/` stops answering from other pods in `wg`; the `backend` deployment itself stays available.
