# "another operation (install/upgrade/rollback) is in progress"
"A colleague started `helm upgrade shop` yesterday evening, his laptop died mid-way. Today every `helm upgrade shop ./shop -n wg-helm` is refused with that message. We need chart 0.2.0 (2 replicas) out."
Work dir: `~/.k8s-wargame/helm/14-pending-upgrade/`. Goal: release `shop` is `deployed` with 2 available replicas. Don't uninstall it.
