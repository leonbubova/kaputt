## 1
`--set` replaces one value for this install only; values.yaml stays as it is. Nested keys use a dot: `page.title`, not `title`.
## 2
Same install line as last lesson plus `--set page.title=Hello` at the end. Verify with `helm get values web -n wg-helm` — it prints exactly the values you set.
## 3
    cd ~/.k8s-wargame/helm/04-set-a-value
    helm install web ./web -n wg-helm --set page.title=Hello
