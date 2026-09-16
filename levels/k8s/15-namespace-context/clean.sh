NS=${NS:-wg}
kubectl config set-context --current --namespace=wg >/dev/null 2>&1 || true
kubectl delete ns team-a --ignore-not-found --wait=false >/dev/null 2>&1 || true
