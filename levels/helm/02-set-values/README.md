# scale it — the helm way
Ticket: "Release `web` in `wg-helm` runs 1 replica. We need 2. Do it through Helm so the next `helm upgrade` doesn't silently scale it back."
Chart copy: `~/.k8s-wargame/helm/02-set-values/web`. Goal: `web` has 2 available replicas and `helm get values web -n wg-helm` shows `replicas: 2`.
