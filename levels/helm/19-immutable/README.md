# "field is immutable"
"Rolling out prod config: `helm upgrade shop ./shop -n wg-helm -f values-prod.yaml` fails with `Deployment.apps "shop" is invalid: spec.selector: Invalid value ... field is immutable`. Prod launch is blocked."
Work dir: `~/.k8s-wargame/helm/19-immutable/`. Goal: release `shop` deployed with 2 available replicas, page shows `env=prod domain=shop.example.com`.
