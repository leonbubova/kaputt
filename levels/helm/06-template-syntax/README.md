# helm install blows up before anything reaches the cluster
"CI runs `helm install web ./web -n wg-helm` and dies with a parse error nobody understands. Nothing gets created."
Your copy of the chart: `~/.k8s-wargame/helm/06-template-syntax/web`. Goal: release `web` is `deployed` in `wg-helm`, pod ready, page at `http://web.wg-helm.svc/`. Keep the memory limit.
