# launch upgrade failed, site degraded
"We ran `helm upgrade shop ./shop -f values-launch.yaml` for the launch. It timed out, new pods are ImagePullBackOff, and we're live in 20 minutes."
Work dir: `~/.k8s-wargame/helm/13-failed-upgrade/`. Goal: release `shop` is `deployed`, 3 available replicas on `nginx:1.27-alpine`, page shows `env=prod`. Keep the release history (no uninstall).
