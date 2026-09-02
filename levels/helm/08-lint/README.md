# pipeline red at the lint stage
"The `helm lint` step in CI fails for chart `web` since the last Chart.yaml cleanup. Deploy is blocked."
Chart copy: `~/.k8s-wargame/helm/08-lint/web`. Goal: `helm lint web` exits 0 and release `web` is deployed in `wg-helm` with a reachable page.
