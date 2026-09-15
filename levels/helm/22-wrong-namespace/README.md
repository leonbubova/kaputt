# release exists, helm can't find it
"The deploy pipeline (`helm upgrade shop ./shop -n wg-helm`) fails with `release: not found`, yet monitoring shows `shop` pods running and eating resources. Somebody installed it by hand."
Chart copy: `~/.k8s-wargame/helm/22-wrong-namespace/shop`. Goal: release `shop` deployed in `wg-helm` and reachable at `http://shop.wg-helm.svc/`; no stray copy left anywhere else.
