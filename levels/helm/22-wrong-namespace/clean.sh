NS=${NS:-wg-helm}
helm uninstall shop -n wg-helm-staging >/dev/null 2>&1 || true
kubectl delete ns wg-helm-staging --ignore-not-found --wait=false >/dev/null 2>&1 || true
