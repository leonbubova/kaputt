# first chart
Ticket: "We're moving to Helm. Scaffold a chart called `hello` in `~/.k8s-wargame/helm/01-create-install/` and install it as release `wg-hello` into namespace `wg-helm`. The scaffold defaults to an nginx tag we don't mirror — run it with image tag `1.27-alpine`."
Goal: release `wg-hello` is `deployed`, its Deployment has 1 available pod running `nginx:1.27-alpine`.
