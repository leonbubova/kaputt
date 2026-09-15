# "cannot re-use a name that is still in use"
"Somebody 'cleaned up' `shop` yesterday. `helm list -n wg-helm` is empty, no pods, nothing — but `helm install shop ./shop -n wg-helm` refuses with that message."
Chart copy: `~/.k8s-wargame/helm/23-name-in-use/shop`. Goal: release `shop` deployed in `wg-helm`, page reachable.
