# a shop without a domain must not install
Ticket: "Last week `shop` went out without a domain and the page said `domain=` for a day. Make chart `shop` refuse to render when `domain` is empty — the error must read `domain is required`. Then install release `shop` in `wg-helm` with the prod settings from `values-prod.yaml`."
Work dir: `~/.k8s-wargame/helm/12-required-value/`. Goal: `helm template shop ./shop` fails with that message, `helm template shop ./shop -f values-prod.yaml` renders, release `shop` deployed with 2 replicas and `domain=shop.example.com`.
